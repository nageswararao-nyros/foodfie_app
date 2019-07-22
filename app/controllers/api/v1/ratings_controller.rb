class Api::V1::RatingsController < ApplicationController

  before_action :restrict_access
  before_action :set_dish, except: [:update]

  def index
    ratings = @dish.ratings
    if ratings.empty?
      render json: { success: 'No', ratings: nil }, status: 200
    else
      render json: { success: 'Yes', ratings: ratings }, status: 200
    end
  end

  def create
    binding.pry
    rating = Rating.find_or_initialize_by(dish_id: @dish.id, user_id: current_user.id)
    rating.attributes = rating_params
    if rating.save
      if params[:comment].present?
        comment = @dish.comments.find_or_initialize_by(user: current_user)
        comment.context = params[:comment]
        comment.save
      end
      @dish.tags.delete_all
      @dish.reload
      if params[:tags].present? && params[:tags].include?("VEGAN")
        veg = params[:tags].include?("VEGETARIAN")
        if !veg
          params[:tags] << "VEGETARIAN"
        end
      end
      @dish.tag_list.add(params[:tags])
      update_dish_details
      if @dish.valid?
        @dish.save
        render json: { success: 'Yes', message: "Thanks for rating this dish #{current_user.first_name}." }, status: 200
      else
        render json: { success: 'No', message: 'Rating has not been created.', errors: @dish.errors.messages }, status: 400
      end
    else
      render json: { success: 'No', message: 'Rating has not been created.', errors: rating.errors.messages }, status: 400
    end
  end

  def update_rate
    rating = Rating.find_by(dish_id: @dish.id, user_id: current_user.id)
    if rating.update_attributes(rating_params)
      if params[:comment].present?
        comment = @dish.comments.find_or_initialize_by(user: current_user)
        comment.context = params[:comment]
        comment.save
      end
      if params[:tags].include?("VEGAN")
        veg = params[:tags].include?("VEGETARIAN")
        if !veg
          params[:tags] << "VEGETARIAN"
        end
      end
      @dish.tag_list.add(params[:tags])
      update_dish_details
      @dish.save
      render json: { success: 'Yes', message: 'Rating has successfully been updated.' }, status: 200
    else
      render json: { success: 'No', message: 'Rating has not been updated.', errors: rating.errors.full_messages }, status: 200
    end
  end

  def update
    rating = Rating.find_by_id(params[:id])
    if rating.update_attributes(rating_params)
      render json: { success: 'Yes', message: 'Rating has successfully been updated.' }, status: 200
    else
      render json: { success: 'No', message: 'Rating has not been updated.', errors: rating.errors.full_messages }, status: 200
    end
  end

  def destroy
    rating = Rating.find_by_id(params[:id])
    if rating && rating.destroy
      render json: { success: 'Yes', message: 'Rating has successfully been destroyed.' }, status: 200
    else
      render json: { success: 'No', message: 'Rating has not been destroyed.' }, status: 200
    end
  end

  private

  def update_dish_details
    #DishesUser.where(user_id: current_user.id, dish_id: @dish.id).update_all(reposted: false)
    @dish.update_attributes(dish_params) if params[:dish].present?
    if params[:image_content_type].present? and params[:image].present?
      image_content_types = %w(image/jpeg image/jpg image/png image/gif)
      image_content_type = params[:image_content_type]
      return render json: { success: 'No', message: "Image content type should be from #{image_content_types*', '}."}, status: 422 if image_content_types.exclude?(image_content_type)
      image_param = params[:image].strip
      begin
        image_file = Paperclip.io_adapters.for("data:#{image_content_type};base64," + image_param)
        bytes = Base64.decode64(image_param)
        img = Magick::Image.from_blob(bytes).first
      rescue => e
        return render json: { success: 'No', message: 'There was error while uploading image.'}, status: 422
      end
      image_file.original_filename = "#{Time.current.to_i}.#{img.format.downcase}"
      if(params[:image_id].present?)
        @attachment_image = Image.find(params[:image_id])
        if @attachment_image.user_id != current_user.id
          @attachment_image = Image.new(user: current_user, attachable_id: @dish.id, attachable_type: @dish.class.name)
        end
      else
        @attachment_image = Image.new(user: current_user, attachable_id: @dish.id, attachable_type: @dish.class.name)
      end
      @attachment_image.image = image_file
      if @attachment_image.valid?
        @attachment_image.save
      else
        p '*'*50
        p @attachment_image.errors.inspect
        p '*'*50
      end
    end
  end

  def rating_params
    params.require(:rating).permit(:weight)
  end

  def dish_params
    params.require(:dish).permit(:name, :price)
  end

  def set_dish
    @dish = Dish.find_by_id(params[:dish_id])
  end
end
