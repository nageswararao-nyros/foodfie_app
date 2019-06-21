class Api::V1::ImagesController < ApplicationController
  before_action :restrict_access
  before_action :set_variables, only: [:create, :update, :destroy]
  before_action :check_valid_image, only: [:create, :update]

  def create
    @attachment_image = Image.new(attachable_id: @attachment.id, attachable_type: @attachment.class.name, image: @image_file, user: current_user)
    if @attachment_image.valid?
      @attachment_image.save
      render json: { success: 'Yes', message: 'Image has successfully been added.', image_url: @attachment_image.secure_image }, status: 200
    else
      render json: { success: 'No', message: 'Image has not been added.', errors: @attachment_image.errors.full_messages }, status: 422
    end
  end

  def update
    @attachment_image = Image.find_by(attachable_id: @attachment.id, attachable_type: @attachment.class.name, id: params[:id])
    return render json: { success: 'No', message: 'Image not found.'}, status: 422 if @attachment_image.nil?
    if @attachment_image.update_attributes(image: @image_file, user: current_user)
      render json: { success: 'Yes', message: 'Image has successfully been updated.', image_url: @attachment_image.secure_image }, status: 200
    else
      render json: { success: 'No', message: 'Image has not been updated.', errors: @attachment_image.errors.full_messages }, status: 422
    end
  end

  def destroy
    @attachment_image = Image.find_by(attachable_id: @attachment.id, attachable_type: @attachment.class.name, id: params[:id])
    return render json: { success: 'No', message: 'Image not found.'} if @attachment_image.nil?
    if @attachment_image.present?
      @attachment_image.destroy
      render json: { success: 'Yes', message: 'Image has successfully been removed.' }, status: 200
    else
      render json: { success: 'No', message: 'Image not found.'}, status: 422
    end
  end

  private

  def set_variables
    if params[:user_id]
      if params[:image_type] == 'profile'
        @attachment = UserProfileImage.find_by_id(params[:user_id])
      elsif params[:image_type] == 'cover'
        @attachment = UserCoverImage.find_by_id(params[:user_id])
      end
      return render json: { success: 'No', message: 'User not found.'} if @attachment.blank?
      params[:id] = Image.find_or_create_by(attachable_id: @attachment.id, attachable_type: @attachment.class.name).id
    else
      @attachment = Dish.find_by_id(params[:dish_id])
      return render json: { success: 'No', message: 'Dish not found.'} if @attachment.nil?
    end
  end

  def check_valid_image
    image_content_types = %w(image/jpeg image/jpg image/png image/gif)
    image_content_type = params[:image_content_type]
    return render json: { success: 'No', message: "Image content type should be from #{image_content_types*', '}."}, status: 422 unless image_content_types.include?(image_content_type)
    image_param = params[:image].strip
    begin
      @image_file = Paperclip.io_adapters.for("data:#{image_content_type};base64," + image_param)
      bytes = Base64.decode64(image_param)
      img = Magick::Image.from_blob(bytes).first
    rescue => e
      return render json: { success: 'No', message: 'There was error while uploading image.'}, status: 422
    end
    @image_file.original_filename = "#{Time.current.to_i}.#{img.format.downcase}"
  end
end
