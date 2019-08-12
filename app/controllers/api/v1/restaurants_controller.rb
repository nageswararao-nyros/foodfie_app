class Api::V1::RestaurantsController < ApplicationController

  before_action :restrict_access
  before_action :set_restaurant, except: [:create, :index, :search, :search_by_name, :suburbs]
  before_action :un_rated_dishes, only: [:show]

  def index
    puts current_user.email
    @restaurants = current_user.followed_restaurants.page(page).per(limit)
    if @restaurants.empty?
      render json: { success: 'No', restaurants: nil }, status: 200
    else
      respond_to :json
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      respond_to :json
    else
      render json: { success: 'No', errors: restaurant.errors.messages, message: 'Restaurant could not be saved.' }, status: 422
    end
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      respond_to :json
    else
      render json: { success: 'No', restaurant: @restaurant.errors.messages, message: 'Restaurant could not be updated successfully.' }, status: 422
    end
  end

  def show
    if @restaurant
      sort_by = 'created_at DESC'
      joins = 'LEFT JOIN "ratings" ON "ratings"."dish_id" = "dishes"."id"' if params[:sort_by] != 'rate'
      @min_price = 0
      @max_price = 0
      @user = current_user
      dishes = @restaurant.dishes
                   .joins(joins)
                   .filters(params)
                   .order(sort_by)
      @min_price = dishes.minimum(:price).to_i
      @max_price = dishes.maximum(:price).ceil if dishes.maximum(:price)
      @dishes = dishes.includes(:restaurant, :favouriters, :ratings, :comments, :images, :tags)
                    .group('dishes.id')
                    .page(page).per(limit)
      @view = "restaurant_profile"
      @dishes = Dish.tags_filter(@dishes, params)
      respond_to :json
    else
      render json: { success: 'No', message: 'There was an error getting the restaurant you requested.'  }, status: 422
    end
  end

  def suggested_restaurants
    @restaurants = Restaurant.where(city: "kakinada").where("EXISTS(SELECT * FROM restaurant_fellowships
   WHERE follower_id != #{current_user.id} )")
    puts @restaurants.length
    if @restaurants
      respond_to :json
    end
  end

  def destroy
    if @restaurant && @restaurant.destroy
      render json: { success: 'Yes', message: 'Restaurant has successfully been destroyed.' }, status: 200
    else
      render json: { success: 'No', message: 'Restaurant has not been destroyed.' }, status: 422
    end
  end

  def follow
    # binding.pry
    if @restaurant.get_followed_by(current_user.id)
      render json: { success: 'Yes', message: 'You successfully followed the restaurant.' }, status: 200
    else
      render json: { success: 'No', message: 'You didn\'t follow the restaurant.' }, status: 422
    end
  end

  def unfollow
    # binding.pry
    if @restaurant.get_unfollowed_by(current_user.id)
      render json: { success: 'Yes', message: 'You successfully unfollowed the restaurant.' }, status: 200
    else
      render json: { success: 'No', message: 'You didn\'t unfollow the restaurant.' }, status: 422
    end
  end

  def favourite
    if @restaurant.get_favourited_by(current_user.id)
      render json: { success: 'Yes', message: 'You successfully favourited the restaurant.' }, status: 200
    else
      render json: { success: 'No', message: 'You didn\'t favourite the restaurant.' }, status: 422
    end
  end

  def unfavourite
    if @restaurant.get_unfavourited_by(current_user.id)
      render json: { success: 'Yes', message: 'You successfully unfavourited the restaurant.' }, status: 200
    else
      render json: { success: 'No', message: 'You didn\'t unfavourite the restaurant.' }, status: 422
    end
  end

  def followers
    if @restaurant.present?
      @followers = @restaurant.followers.includes(:followers, :profile_image, :cover_image).page(page).per(limit)
      respond_to :json
    else
      render json: { success: 'No', message: 'This restaurant has no followers.', followers: nil }, success: 200
    end
  end

  def favoruiters
    if @restaurant.favouriters.present?
      render json: { success: 'Yes', favouriters: @restaurant.favouriters, message: "This restaurant has #{@restaurant.favouriters.count} favouriter(s)." }, status: 200
    else
      render json: { success: 'Yes', message: 'This user has no favouriters.', favouriters: nil }, success: 200
    end
  end

  def suburbs
    client = GooglePlacesAutocomplete::Client.new(:api_key => 'AIzaSyCDQE3TvjnrWGpWwngB6TryWvpFm7RiAAw')
    autocomplete = client.autocomplete(:input => params[:keyword], :types => "(cities)", components: "country:in")
    cities = []
    autocomplete["predictions"].map{|pr| cities << {name: pr["terms"].first["value"] + ", " + pr["terms"].second["value"]}}
    cities.uniq!{|s| s[:name] }
    cities.sort_by!{|s| s[:name] }
    return render json: cities
    # suburbs = []
    # Ausburbs.state_names.each do |state_name|
    #   ausburbs = Ausburbs.state(state_name).suburbs.select{|n| n.name.start_with?(params[:keyword].upcase)}
    #   ausburbs.each do |ausburb|
    #     suburbs << {name: format('%s, %s', ausburb.name, ausburb.state), latitude: ausburb.latitude, longitude: ausburb.longitude}
    #   end
    # end
    # suburbs.uniq!{|s| s[:name] }
    # suburbs.sort_by!{|s| s[:name] }
    # return render json: suburbs
  end

  def search
    @restaurants = Restaurant.search_by_name(params[:search])
                       .includes({dishes: :ratings}, :followers, :favouriters)
                       .select("restaurants.*, (SELECT COUNT(*) FROM users u INNER JOIN restaurant_fellowships ON u.id = restaurant_fellowships.follower_id WHERE restaurant_fellowships.restaurant_id = restaurants.id AND u.id = #{current_user.id}) AS followers_cnt")
                       .order("(SELECT COUNT(*) FROM users u INNER JOIN restaurant_fellowships ON u.id = restaurant_fellowships.follower_id WHERE restaurant_fellowships.restaurant_id = restaurants.id AND u.id = #{current_user.id}) DESC")
                       .page(page).per(limit)
    if @restaurants.present?
      render :file => 'api/v1/restaurants/index'
    else
      render json: { success: 'No', restaurants: nil }, status: 200
    end
  end

  def search_by_name
    restaurants = Restaurant.search(params[:search])
    @restaurants_search = []
    rest_names = restaurants.map(&:name).uniq
    rest_names.each do |rest_name|
      locations = restaurants.collect{|r| r if r.name.strip == rest_name.strip}.compact.uniq
      restaurant = {
          id: locations.first.id,
          name: locations.first.name.strip,
          locations:
              locations.map do |location|
                {
                    id: location.id,
                    address: location.address
                }
              end
      }
      @restaurants_search << restaurant
    end
    @restaurants_search.uniq!
    if @restaurants_search.blank?
      render json: { success: 'Yes', message: 'Sorry, your search matched with no records. Please try something else.', restaurants: nil}
    else
      respond_to :json
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.where(id: params[:id]).includes(:dishes => :ratings).first
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :latitude, :longitude)
  end
end
