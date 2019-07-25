class ImageUploaderJob < Struct.new(:attachment_local_image, :current_user, :dish, :image_content_type, :image_param, :image_name)
  def perform
  	image_file = Paperclip.io_adapters.for(image_param)
  	# bytes = Base64.decode64(image_param)
  	# img = Magick::Image.from_blob(bytes).first
  	image_file.original_filename = image_name
    @attachment_image = Image.find_or_initialize_by(user: current_user, attachable_id: dish.id, attachable_type: dish.class.name)
    @attachment_image.image = image_file
    @attachment_image.image_processing = false
    @attachment_image.save if @attachment_image.valid?
    attachment_local_image.local_image.destroy
  end
end

