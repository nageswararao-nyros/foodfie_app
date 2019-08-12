class Dish < ActiveRecord::Base
  PRICE_REGEX = /\A[0-9]\d{0,4}(\.\d{1,2})?%?\z/

  has_many :comments, dependent: :destroy, as: :commentable
  has_many :dish_affections, dependent: :destroy
  has_many :favouriters, dependent: :destroy, through: :dish_affections
  has_many :ratings, dependent: :destroy
  has_many :dishes_users
  has_and_belongs_to_many :users
  belongs_to :restaurant
  has_many :images, dependent: :destroy, as: :attachable
  attr_accessor :distance
  # belongs_to :image

  acts_as_taggable

  validates :name, presence: true
  validates :price, format: { with: PRICE_REGEX , message: 'Dish price is too high'}

  validate :price_check

  # after_create :save_restaurant_image, :send_notification_restaurant

  scope :latest, -> { order('dishes.id desc') }
  scope :search_results, -> (key) { where("lower(dishes.name) LIKE ?", "%#{key}%")}

  scope :filters, -> options {
    sort_by = ''; q = []; having = nil; joins = []
    if options[:sort_by].present?
      if options[:sort_by].downcase == 'rating'
        sort_by = 'avg(ratings.weight) DESC NULLS LAST, "dishes"."id" DESC'
      elsif options[:sort_by].downcase == 'price'
        sort_by = 'dishes.price ASC'
      end
    end
    if options[:rating].present?
      having = "avg(coalesce(ratings.weight, 0)) >= #{options[:rating]}"
    end
    if options[:rating].present? || options[:sort_by].to_s.downcase == 'rating'
      joins << 'LEFT JOIN "ratings" ON "ratings"."dish_id" = "dishes"."id"'
    end
    min = options[:min_price].to_i
    max = options[:max_price]

    # if max.present?
    #   q << "dishes.price BETWEEN #{min} AND #{max}"
    # else
    #   q << "dishes.price >= #{min}"
    # end

    if options[:distance_range].present? && options[:distance_range].to_i > 0
      location = Geocoder.coordinates("#{options[:location]}")
      ids = []
      all.each do |dish|
        distance = Geocoder::Calculations.distance_between(location, dish.restaurant, {units: :km})
        if distance > options[:distance_range].to_i
          ids << dish.id
        end
      end
      q << "dishes.id NOT IN (#{ids.map(&:inspect).join(", ")})" if ids.present?
    end
    conditions = q * ' AND '
    joins(joins).where(conditions).order(sort_by).having(having)
  }

  def save_restaurant_image
    if self.restaurant.image.nil?
      Delayed::Job.enqueue(RestaurantImageUploaderJob.new(self.restaurant))
    end
  end

  def get_favourited_by(user_id)
    self.favouriters << User.find_by_id(user_id) unless self.favouriter_ids.include? user_id
  end

  def get_unfavourited_by(user_id)
    affection = self.dish_affections.where(favouriter_id: user_id).first
    affection && affection.delete
  end

  def favourited_by? user
    self.favouriters.include? user
  end

  def average_rating
    # ratings.average(:weight) || 0.0
    rates = ratings.map(&:weight)
    rate = rates.empty? ? 0 : (rates.sum.to_f/rates.size).round(1)
    (rate % 1) > 0 ? rate : rate.to_i
  end

  def votes
    self.ratings.size
  end

  def rating_by user
    ratings.select{|rate| rate if rate.user_id == user.id}.compact.last
  end

  def comment_by user
    comments.select{|comment| comment if comment.user_id == user.id}.compact.last
  end

  def rating_for user
    ratings.select{|rate| rate if rate.user_id == user.id}.compact.first.try(:weight)
  end

  def reposted user
    # DishesUser.find_by(user_id: user.id, dish_id: self.id).try(:reposted) || false
    !!dishes_users.select{|dish_user| dish_user if dish_user.user_id == user.id}.compact.first.try(:reposted)
  end

  def self.search(search_text)
    if search_text.present?
      search_text_without_s = search_text.chomp('s')
      where('lower(dishes.name) LIKE ? OR lower(dishes.description) LIKE ?',"%#{search_text.downcase}%", "%#{search_text.downcase}%")
    else
      where(nil)
    end
  end

  def self.search_by_name(search_text)
    if search_text.present?
      where('lower(dishes.name) LIKE ?',"%#{search_text.downcase}%")
    else
      where(nil)
    end
  end

  def self.tags_filter(dishes, params)
    if params[:meals] && params[:dietarian].present?
      dietarian = dishes.tagged_with(params[:dietarian], :all => true)
      dishes = dietarian.tagged_with(params[:meals], :any => true)
    elsif params[:dietarian].present?
      if params[:dietarian].size > 1
        dietarian = dishes.tagged_with(params[:dietarian], :all => true)
        if params[:dietarian].include?("vegetarian")
          params[:dietarian] << "VEGAN"
        end
        dishes = dishes.tagged_with(params[:dietarian], :all => true)
        dishes = dishes + dietarian
      else
        dishes = dishes.tagged_with(params[:dietarian], :any => true)
      end
    elsif params[:meals].present?
      dishes = dishes.tagged_with(params[:meals], :any => true)
    end
    dishes.class.name == "Array" ? dishes.uniq : dishes
  end

  def self.ratings_filter(dishes, params)
    having = "avg(coalesce(ratings.weight, 0)) >= #{params[:rating]}"
    dishes.having(having).group("dishes.id, restaurants.id, ratings.id, images.id, users.id, tags.id")
  end

  def dish_image size
    dish_image = self.images.last
    dish_image ? dish_image.secure_image(size) : ApplicationController.helpers.asset_path('missing.jpg')
  end

  def send_notification_restaurant
    type = 'restaurant'
    type_id = self.restaurant.id
    title = "New Dish!"
    message = "New Dish is added to your favorite/followed restaurant"
    favouriters = self.restaurant.favouriters.pluck(:device_id)
    followers = self.restaurant.followers.pluck(:device_id)
    registration_ids = favouriters + followers
    Delayed::Job.enqueue(SendNotificationJob.new(type, type_id, title, message, registration_ids.uniq))
  end

  def send_notification_user
    # binding.pry
    # type = 'user'
    # type_id = self.restaurant.id
    # title = "New Dish!"
    # message = "New Dish is added to your favorite/followed restaurant"
  end

  private

  def price_check
    errors.add(:price, 'Dish price is too high') if price && price > 9999.99
  end
end
