class Restaurant < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :dishes
  has_many :restaurant_fellowships
  has_many :followers, through: :restaurant_fellowships
  has_many :restaurant_affections
  has_many :favouriters, through: :restaurant_affections
  has_one  :image, dependent: :destroy, as: :attachable

  geocoded_by :address
  #after_validation :geocode, if: :address_changed?

  validates :name, :address, presence: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  before_save :round_lat_long
  attr_accessor :distance
  scope :search_by_name, ->(search) { where('LOWER(restaurants.name) like ?', "%#{search.downcase}%" )}

  scope :search_results, -> (box, key) { within_bounding_box(box).includes(:image, {dishes: [:ratings]}, :followers, :favouriters).where("lower(name) LIKE ?", "%#{key}%") }

  scope :filters, -> options do
    options[:sort_by] ||= 'Distance'
    sort_by = ''; q = []; having = nil; joins = []
    joins << 'INNER JOIN "dishes" ON "dishes"."restaurant_id" = "restaurants"."id"'
    if options[:sort_by].present?
      if options[:sort_by].downcase == 'rating'
        sort_by = 'avg(case when ratings.weight != 0
                              then ratings.weight
                              else null
                            end) DESC NULLS LAST'
      end
    end
    if options[:rating].present? || options[:sort_by].to_s.downcase == 'rating'
      joins << 'LEFT JOIN "ratings" ON "ratings"."dish_id" = "dishes"."id"'
    end
    min = options[:min_price].to_i
    max = options[:max_price]

    if max.present?
      q << "dishes.price BETWEEN #{min} AND #{max}"
    else
      q << "dishes.price >= #{min}"
    end

    if options[:rating].present?
      having = "avg(coalesce(ratings.weight, 0)) >= #{options[:rating]}"
    end

    conditions = q * ' AND '

    if(options[:latitude].present? && options[:longitude].present? && options[:sort_by].downcase == 'distance')
      distance = options[:distance].to_i > 0 ? options[:distance] : 10
      joins(joins).where(conditions).order(sort_by).having(having).near([options[:latitude], options[:longitude]], distance, {units: :km})
    else
      joins(joins).where(conditions).order(sort_by).having(having)
    end
  end

  def round_lat_long
    self.longitude = Float(self.longitude).round(7) if self.longitude
    self.latitude = Float(self.latitude).round(7) if self.latitude
  end

  def get_followed_by(user_id)
    user = User.find_by_id(user_id)
    if user
      self.followers << user unless followed_by? user
    else
      false
    end
  end

  def address_format
    pin = []
    address.scan(/\b\d{4}\b/) do |c|
      pin << [c, $~.offset(0)[0]]
    end
    pin.map{|p| p[1] != 0 ? address.slice!(p[0]): nil}
    address.slice!(", Australia")
    address
  end

  def get_unfollowed_by(user_id)
    fellowship = self.restaurant_fellowships.where(follower_id: user_id).first
    fellowship.try(:delete)
  end

  def get_favourited_by(user_id)
    self.favouriters << User.find_by_id(user_id) unless self.favouriter_ids.include? user_id
  end

  def get_unfavourited_by(user_id)
    affection = self.restaurant_affections.where(favouriter_id: user_id).first
    affection && affection.delete
  end

  def followed_by?(user)
    self.followers.include? user
  end

  def favourited_by?(user)
   self.favouriters.include? user
  end

  # def rating
  #   count = 0
  #   sum   = 0
  #   @rating = 0
  #   dishes.each do |dish|
  #     if dish.average_rating > 0
  #       sum   += dish.average_rating
  #       count += 1
  #     end
  #   end
  #   if count > 0
  #     @rating = (sum / count).to_f.round(1) if count > 0
  #     @rating = (@rating % 1) > 0 ? @rating : @rating.to_i
  #   end
  #   @rating
  # end

  def votes
    dishes.map(&:ratings).flatten.size
  end

  def self.search(search_text)
    if search_text.present?
      where('lower(restaurants.name) LIKE ?', "%#{search_text.downcase}%")
    else
      where(nil)
    end
  end

  def update_google_place_id(google_place_id)
    if self.google_place_id.nil?
      self.google_place_id = google_place_id
      self.save!
    end
  end

  def self.lookup_by_lat_lng(latitude, longitude)
    latitude = Float(latitude).round(7) if latitude
    longitude = Float(longitude).round(7) if longitude
    restaurant = self.where(latitude: latitude, longitude: longitude).first
    # if !restaurant.nil? && restaurant.phone_number.nil?
    #   restaurant.update_google_place_id(google_place_id)
    # end
    restaurant
  end


  def self.get_by_name(restaurant_name)
    restaurant = self.where('name LIKE ?',"%#{restaurant_name}%").first
  end

  def self.get_phone_number(google_place_id)
    if google_place_id
      details = Geocoder.search(google_place_id, lookup: :google_places_details)
      phone_number = details[0].data["formatted_phone_number"]
    end
  end

end
