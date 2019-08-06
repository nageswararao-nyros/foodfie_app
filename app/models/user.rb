class User < ActiveRecord::Base

  EMAIL_REGEX    = /\A[A-Z0-9._%a-z\-\+]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  USERNAME_REGEX = /\A[A-Za-z0-9_]{4,30}\z/
  FIRST_NAME_REGEX = /\A[A-Za-z\s]{1,30}\z/
  LAST_NAME_REGEX = /\A[A-Za-z\s]{0,30}\z/
  PASSWORD_REGEX = /((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})/

  has_secure_password validations: false

  # has_many :packages
  has_many :comments, dependent: :destroy
  has_many :restaurant_fellowships, foreign_key: :follower_id
  has_many :followed_restaurants, through: :restaurant_fellowships, foreign_key: :follower_id, source: :restaurant
  has_many :restaurant_affections, foreign_key: :favouriter_id
  has_many :favourited_restaurants, through: :restaurant_affections, foreign_key: :favouriter_id, source: :restaurant
  has_many :authentications,dependent: :destroy
  has_many :dish_affections, foreign_key: :favouriter_id
  has_many :favourited_dishes, through: :dish_affections, foreign_key: :favouriter_id, source: :dish
  has_and_belongs_to_many :dishes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :user_fellowships, dependent: :destroy
  has_many :images
  has_many :followers, through: :user_fellowships
  has_many :followings, :class_name => "UserFellowship", :foreign_key => "follower_id"
  has_many :following, :through => :followings, :source => :user

  has_one :profile_image, -> { where attachable_type: "UserProfileImage"},
          :class_name => 'Image', foreign_key: :attachable_id,
          foreign_type: :attachable_type

  has_one :cover_image, -> { where attachable_type: "UserCoverImage"},
          :class_name => 'Image', foreign_key: :attachable_id,
          foreign_type: :attachable_type

  has_many :dish_likes, dependent: :destroy

  # validates :username, :email, :first_name, :last_name, presence: true
  # validates :email,      format: { with: EMAIL_REGEX , message: 'Please enter a valid email address'}
  validate :check_uniqueness

  validates :first_name, format: { with: FIRST_NAME_REGEX , message: 'must have between 1 and 30 characters and contain letters and spaces only'}, length: { in: 1..30 , message: 'must have between 1 and 30 characters and contain letters and spaces only'}
  validates :last_name,  format: { with: LAST_NAME_REGEX , message: 'has a 30 character limit. Please use letters and spaces only.'}
  validates :username,   format: { with: USERNAME_REGEX, message: 'has to have a minimum of 4 characters and max of 30 characters, please use letters, numbers and underscores only'},   length: { in: 4..30, message: 'has to have a minimum of 4 characters and max of 30 characters, please use letters, numbers and underscores only'}

  validates :password, presence: true, on: :create
  validates :password, length: { in: 1..20 }, allow_blank: true, on: :update

  # validates :password, format: { with: PASSWORD_REGEX, message: 'must have between 6 and 20 characters and contain at least one uppercase, one lowercase and one number' }, on: :create, unless: :created_from_third_party?
  # validates :password, length: { in: 6..20 }, allow_blank: true, on: :update

  # validates :email, uniqueness: {message: 'This email is already registered, please head to login'}
  # validates :username, uniqueness: {message: 'Sorry! that username is taken'}

  before_create :confirmation_token
  # after_create :send_activation_email
  before_save :downcase_email, :downcase_username, :squish_first_name_and_last_name
  before_destroy :destroy_related_info

  attr_accessor :provider

  scope :search_by_name, ->(search) { where('LOWER(users.username) like ? OR LOWER(users.first_name) like ? OR LOWER(users.last_name) like ? OR LOWER(users.email) like ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")}

  def get_followed_by(user_id)
    user = User.find_by_id(user_id)
    if user
      self.user_fellowships.create(follower_id: user.id, user_id: self.id)
    else
      false
    end
  end

  class << self
    @foo = 42
  end

  def destroy_related_info
    dishes.each do |dish|
      users = dish.users
      if users.count == 1
        dish.destroy
      else
        if dish.images.length > 1
          dish.images.where(user: self).destroy_all
        end
      end
    end
    images.where(attachable_type: "UserProfileImage").destroy_all
  end

  def get_unfollowed_by(user_id)
    user_fellowship = self.user_fellowships.where(follower_id: user_id).first
    user_fellowship.try(:delete)
  end

  def followings
    UserFellowship.where(follower_id: self.id)
  end

  def username
    self[:username]
  end

  def first_name
    self[:first_name].to_s.titleize if self[:first_name]
  end

  def last_name
    self[:last_name].to_s.titleize if self[:last_name]
  end

  def name
    [first_name, last_name]*' '
  end

  def user_image
    self.profile_image.try(:secure_image) || ApplicationController.helpers.asset_path('missing.png')
  end

  def set_activation_code
    self.activation_token = SecureRandom.urlsafe_base64
  end

  def send_activation_email
    if self.provider != "facebook"
      UserMailer.send_activation_email(self).deliver_now
    else
      self.activated = true
      self.save
    end
  end

  def set_password_reset_token
    begin
      self.reset_password_token = SecureRandom.urlsafe_base64 nil, false
    end while self.class.exists? reset_password_token: reset_password_token
    self.reset_password_token_sent_at = Time.now
    save!(validate: false)
  end

  def send_password_reset_email
    UserMailer.send_password_reset_email(self).deliver_now
  end

  def set_authentication_token
    begin
      self.authentication_token = SecureRandom.hex
    end while self.class.exists? authentication_token: authentication_token
    self.save(validate: false)
  end

  def set_device_token token
    self.device_id = token
    self.save(validate: false)
  end

  def remove_authentication_token
    self.authentication_token = nil
  end

  def downcase_username
    self.username = self.username.downcase
  end

  def downcase_email
    if self.email.present?
      self.email = self.email.downcase
    end
  end

  def squish_first_name_and_last_name
    self.first_name.squish! if first_name.present?
    self.last_name.squish!  if last_name.present?
  end

  def created_from_third_party?
    !authentications.empty? && password.blank?
  end

  def generate_random_username!
    username = ''
    begin
      username = (0..7).map { (97 + rand(26)).chr }.join
    end until User.unique_username? username
    self.username = username
  end

  def self.unique_username?(username)
    !User.find_by(username: username)
  end

  def brand string
    @a = string
    self
  end

  def make string
    @b = string
    self
  end

  def log
    "#{@a} #{@b}"
  end

  private
  def check_uniqueness
    errors.add(:base, 'Please enter a valid email address') unless email.to_s.match EMAIL_REGEX
    errors.add(:base, 'Looks like this email is already registered, head over to the login screen to sign in') if email && User.where.not(id: id).where(email: downcase_email).exists?
    errors.add(:base, 'Sorry! that username is taken') if username && User.where.not(id: id).where(username: downcase_username).exists?
  end

  def confirmation_token
    if self.activation_token.blank?
      self.activation_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
