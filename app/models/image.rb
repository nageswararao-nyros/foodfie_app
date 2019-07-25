class Image < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  belongs_to :user
  belongs_to :dish
  belongs_to :restaurant
  has_many :dish_likes, dependent: :destroy

  has_attached_file :image,
                    :default_url => "/images/:style/missing.png",
                    :path        => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url         => "#{ActionController::Base.asset_host}/system/:attachment/:id/:style/:filename",
                    :styles      =>  { medium: "400x400>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :image,less_than: 5.megabytes, :message => 'must be smaller than 5mb'


  def res_picture_from_url(url)
     self.image = open(url)
  end

  def authenticated_s3_get_url(style = nil, expires_in = 30.minutes)
    self.image.expiring_url(expires_in, (style || image.default_style))
  end

  def secure_image(style = :medium)
    if !is_processing
      self.image.url(style)
    else
      self.image.url(style)
    end
  end

  # save dish image
  def self.save_dish_image(current_user, dish, image_content_type, image_param, image_name)
    # local image
    # binding.pry
    image_file = Paperclip.io_adapters.for(image_param)
    bytes = Base64.decode64(image_param)
    # img = image_content_type.partition('/').last
    image_file.original_filename = image_name
    attachment_local_image = Image.find_or_initialize_by(user: current_user, attachable_id: dish.id, attachable_type: dish.class.name)
    attachment_local_image.image = image_file
    attachment_local_image.image_processing = true
    attachment_local_image.save if attachment_local_image.valid?

    # live image
    # Delayed::Job.enqueue(ImageUploaderJob.new(attachment_local_image, current_user, dish, image_content_type, image_param))
  end

  def is_processing
    self.image_processing
  end

  def likes
    DishLike.where(image_id: self.id, user_id: User.pluck(:id))
  end
end