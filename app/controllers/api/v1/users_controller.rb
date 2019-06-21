class Api::V1::UsersController < ApplicationController
  include PushNotificationUtils
  before_action :restrict_access, except: [:check_uniqueness, :refresh_token]
  before_action :set_user, only: [:follow, :unfollow, :update, :followers, :refresh_token]
  before_action :un_rated_dishes, only: [:profile,:favourited_dishes,:show]

  def index
    @current_user_followers = current_user.followers.all
    @users = current_user.following.where.not(id: current_user.id).page(page).per(limit)
    if @users.present?
      respond_to :json
    else
      render json: { success: 'No', users: nil }, status: 200
    end
  end

  def followers
    @followers = @user.followers.includes(:followers, :profile_image, :cover_image).page(page).per(limit)
    respond_to :json
  end

  def check_uniqueness
    if User.columns.map(&:name).any? { |column| column == params[:key]  }
      if User.find_by(params[:key] => params[:value])
        render json: { message: "A user with #{params[:key]}=#{params[:value]} alreay exists.", unique: :no }, status: 200
      else
        render json: { message: "No user with #{params[:key]}=#{params[:value]} exists.", unique: :yes }, status: 401
      end
    else
      render json: { message: "Sorry, this pair doesn't exist in the database." }, status: 404
    end
  end

  def show
    if current_user
      # render json: { success: 'Yes', message: 'You have successfully retrieved the user.', user: current_user, un_rated_dishes: @un_rated_dishes}, status: 200
    else
      render json: { success: 'No', message: 'There was a problem in getting the user', user: nil }, status: 404
    end
  end

  def follow
    if UserFellowship.exists?(follower_id: current_user.id, user_id: @user.id)
      render json: { success: 'No', message: 'You are already following this user.' }, status: 422
    else
      if @user.get_followed_by(current_user.id)
        render json: { success: 'Yes', message: 'You successfully followed the user.' }, status: 200
        type = 'user'
        type_id = current_user.id
        title = "Following"
        message = "#{current_user.first_name} started following you"
        registration_ids = [@user.device_id]
        Delayed::Job.enqueue(SendNotificationJob.new(type, type_id, title, message, registration_ids))
      else
        render json: { success: 'No', message: 'You didn\'t follow the user.' }, status: 422
      end
    end
  end

  def unfollow
    if UserFellowship.exists?(follower_id: current_user.id, user_id: @user.id)
      if @user.get_unfollowed_by(current_user.id)
        render json: { success: 'Yes', message: 'You successfully unfollowed the user.' }, status: 200
      else
        render json: { success: 'No', message: 'You didn\'t unfollow the user.' }, status: 422
      end
    else
      render json: { success: 'No', message: 'You already unfollowed this user.' }, status: 422
    end
  end

  def like
    if DishLike.exists?(user_id: params[:user_id], image_id: params[:image_id])
      image = Image.find(params[:image_id])
      @likes = image ? image.likes.size : nil
      render json: { success: 'No', message: 'You are already like this Dish.', likes: @likes }, status: 422
    else
      DishLike.create(user_id: params[:user_id], image_id: params[:image_id])
      image = Image.find(params[:image_id])
      @likes = image ? image.likes.size : nil
      render json: { success: 'Yes', message: 'You successfully liked the Dish.', likes: @likes }, status: 200
    end
  end

  def unlike
    if DishLike.exists?(user_id: params[:user_id], image_id: params[:image_id])
      DishLike.find_by_user_id_and_image_id(params[:user_id], params[:image_id]).delete
      image = Image.find(params[:image_id])
      @likes = image ? image.likes.size : nil
      render json: { success: 'Yes', message: 'You successfully unliked the Dish.', likes: @likes }, status: 200
    else
      image = Image.find(params[:image_id])
      @likes = image ? image.likes.size : nil
      render json: { success: 'No', message: 'You are already unlike this Dish.', likes: @likes }, status: 422
    end
  end

  def followed_restaurants
    @followed_restaurants = current_user.followed_restaurants.page(page).per(limit)
    if @followed_restaurants.present?
      respond_to :json
    else
      render json: { success: 'Yes', message: 'This user has not followed any restaurants.', restaurants: nil }, success: 200
    end
  end

  def favourited_restaurants
    @favourited_restaurants = current_user.favourited_restaurants
                                  .includes(dishes: [:ratings, :images])
                                  .group('restaurants.id')
                                  .page(page).per(limit)
    if @favourited_restaurants.present?
      respond_to :json
    else
      render json: { success: 'Yes', message: 'This user has not favourited any restaurants.', restaurants: nil }, success: 200
    end
  end

  def favourited_dishes
    dish_page = params[:page] || page
    dish_limit = params[:limit] || limit
    if params[:view].present?
      dish_limit = dish_page.to_i * dish_limit.to_i
      dish_page = 1
    end
    @is_other_user = params[:id].present?
    @user = (@is_other_user ? User.find_by_id(params[:id]) : current_user)
    @min_price = 0
    @max_price = 0
    dishes = current_user.favourited_dishes.filters(params)
    @min_price = dishes.minimum(:price).to_i
    @max_price = dishes.maximum(:price).ceil if dishes.maximum(:price)
    @favourited_dishes = dishes.includes(:ratings, :images)
                             .group('dishes.id')
                             .page(dish_page).per(dish_limit)
    @favourited_dishes = Dish.tags_filter(@favourited_dishes,params)
    if @favourited_dishes.present?
      respond_to :json
    else
      render json: { success: 'Yes', message: 'This user has not favourited any dishes.', dishes: nil, un_rated_dishes: @un_rated_dishes }, success: 200
    end
  end

  def profile
    page = params[:page]
    limit = params[:limit]
    @is_other_user = params[:id].present?
    @user = (@is_other_user ? User.find_by_id(params[:id]) : current_user)
    @dishes = @user.dishes
                .joins('INNER JOIN "restaurants" ON "restaurants"."id" = "dishes"."restaurant_id"')
                .includes(:restaurant, :favouriters, :ratings, :comments, :images, :tags)
                .filters(params)
                .group('dishes.id','dishes_users.id')
                .latest
    @dishes = Dish.tags_filter(@dishes, params)

    if params[:sort_by] == "Rating"
      @dishes = @dishes.sort_by{|d| -(d.rating_by(@user).try(:weight).to_f)}
    end
    @dishes = Kaminari.paginate_array(@dishes).page(page).per(limit)
    @badges = []
    user_ids = User.joins(:images).where("images.attachable_type = ?", "Dish").group("users.id").having("count(users.id) >= 10").limit(500).pluck(:id)
    if user_ids.include? @user.id
      @badge = Badge.find_by_title("Pioneer")
      @badges << {title: @badge.title, description: @badge.description, image_url: asset_host + @badge.image.url}
    end
  end

  def delete_dish_from_profile
    begin
      dish_id = params[:dish_id]
      dish = Dish.find(dish_id)
      if dish.users.count > 1
        current_user.dishes.delete(dish)
        # favourited_dish = current_user.dish_affections.where(dish_id: dish_id).first
        # favourited_dish.destroy if favourited_dish.present?
        rated_dish = current_user.ratings.where(dish_id: dish_id).first
        rated_dish.destroy if rated_dish.present?
        comment_dish = current_user.comments.where(commentable_id: dish_id).first
        comment_dish.destroy if comment_dish.present?
        dish_image = current_user.images.where(attachable_id: dish_id)
        dish_image.destroy_all if dish_image.present?
      else
        dish.destroy
      end
      render json: { success: 'Yes', message: 'Dish has successfully removed from profile.' }, status: 200
    rescue
      render json: { success: 'No', message: 'Something went wrong please try', dishes: nil }, status: 200
    end
  end

  def update
    if @user.present?
      old_email = @user.email
      if @user.update(user_params)
        if user_params[:email] == old_email
          render json: { success: 'Yes', message: 'User has successfully been updated.' }, status: 200
        else
          @user.send_activation_email
          @user.activated = false
          @user.save
          render json: { success: 'Yes', message: 'We’ve emailed you a link, please head to your inbox to validate this email address' }, status: 200
        end
      else
        message = @user.errors.full_messages.first
        render json: { success: 'No', message: message }, status: 200
      end
    else
      render json: { success: 'No', message: 'User has not been updated.', errors: @user.errors.full_messages }, status: 200
    end
  end

  def update_password
    if current_user && current_user.authenticate(params[:user][:current_password])
      if current_user && current_user.update_attributes(password: params[:user][:password])
        render json: { success: 'Yes', message: 'Password has successfully been updated.' }, status: 200
      else
        render json: { success: 'No', message: current_user.errors.full_messages.first, errors: current_user.errors.full_messages.first }, status: 200
      end
    else
      render json:{success: 'no', message: 'Incorrect Current Password.', errors: current_user.errors.full_messages }, status: 200
    end
  end

  def refresh_token
    render json: @user.slice(:authentication_token)
  end

  def search
    @current_user_followers = current_user.followers.all
    @users = User.search_by_name(params[:search])
                 .includes(:followers, :profile_image, :cover_image)
                 .where.not(id: current_user.id)
                 .select("users.*, (SELECT COUNT(*) FROM users u INNER JOIN user_fellowships ON u.id = user_fellowships.follower_id WHERE user_fellowships.user_id = users.id AND u.id = #{current_user.id}) as followers_cnt")
                 .order("followers_cnt DESC")
                 .page(page).per(limit)
    if @users.present?
      render :file => 'api/v1/users/index'
    else
      render json: { success: 'No', users: nil }, status: 200
    end
  end

  def rating_view_image
    dish = Dish.find(params[:id])
    comment = dish.comments.where(:user_id => current_user.id).first
    comment = comment.present? ? comment.context : ""
    if dish.images
      if dish.images.length > 1
        image_rec = dish.images.map{|img| img.user == current_user ? img : nil}.compact.first
      else
        image_rec = dish.images.first
      end
      if image_rec && !image_rec.image_processing
        @url = image_rec && image_rec.image.url
      else
        @url = image_rec && image_rec.image.url
      end
    end
    render json: { success: 'Yes', url: @url, comment: comment}
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
    render json: { success: 'No', message: 'User not found' }, status: 200 if @user.nil?
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
  end
end
