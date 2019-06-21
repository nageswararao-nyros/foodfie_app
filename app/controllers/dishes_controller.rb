class DishesController < ApplicationController

  def show
    @dish = Dish.where(id: params[:id]).includes(:images, :restaurant).first
    redirect_to '/' and return if @dish.nil?
    @comments = @dish.comments.includes({user: :profile_image }).order('created_at DESC')
  end

  def search
    params.delete_if {|k,v| v.blank?}
    @search_key = params[:search]
    params[:limit] = 16
    dish_page = params[:dish_page] || page
    restaurant_page = params[:restaurant_page] || page
    dish_limit = params[:dish_limit] || limit
    conditions = ''
    if current_location['city'].present?
      locations = Geocoder.search("#{current_location['city']}, #{current_location['region_code']}")
      if locations.empty?
        session[:location] = request.location.data
        locations = Geocoder.search("#{current_location['city']}, #{current_location['region_code']}")
      end
      unless locations.empty?
        location = locations[0].geometry['location']
        # box = Geocoder::Calculations.bounding_box([location['lat'], location['lng']], 10, {units: :km})
        # restaurants = Restaurant.within_bounding_box(box).select('id').to_sql
        # conditions = "restaurant_id IN (#{restaurants})"
        restaurants = Restaurant.near([location['lat'], location['lng']], 10, units: :km, conditions: 'distance <= 10', select: 'id')
        conditions = {restaurant_id: restaurants.map(&:id)}
      end
    end
    location = Geocoder.coordinates(current_location['city'])

    sort_params = params[:sort_by]
    params[:sort_by] = nil
    dishes = Dish.where(conditions)
                 .joins('INNER JOIN restaurants ON dishes.restaurant_id = restaurants.id', :tags)
                 .search(params[:search])
                 .filters(params)
                 .group('dishes.id')
    @total_dishes = dishes.size.sum{|d| 1}
    dishes = dishes.order(price: :desc)
    @min_price = dishes.last.price.ceil rescue nil
    @max_price = dishes.first.price.ceil rescue nil
    @sel_min_price = params['min_price'] || @min_price
    @sel_max_price = params['max_price'] || @max_price

    params[:sort_by] = sort_params
    params[:sort_by] ||= 'rating'
    @dishes = Dish.where(conditions)
                  .joins('INNER JOIN restaurants ON dishes.restaurant_id = restaurants.id', :tags)
                  .search(params[:search])
                  .filters(params)
                  .group('dishes.id').includes(:restaurant, :favouriters, :ratings, :images)
                  .page(dish_page).per(dish_limit)

    @dishes = Dish.tags_filter(@dishes, params)
    @restaurants = Restaurant.where(id: @dishes.map(&:restaurant_id)).includes(:dishes)

    @refresh_results = ((params['min_price'].present? || params['max_price'].present? || params['sort_by'].present? || params['rating'].present? || params['tags'].present?) && params['dish_page'].to_i == 1)

    @search_params = { 'dish_page' => (dish_page.to_i+1)}
    @search_params.merge!(params.except('controller', 'action', '_', 'dish_page', 'limit'))
    @hash = []
    @restaurants.uniq.each do |restaurant|
      next if restaurant.latitude.nil? || restaurant.longitude.nil?
      location_hash = [restaurant.address, restaurant.latitude, restaurant.longitude, restaurant.name, (restaurant.dishes & @dishes).size, restaurant.id]
      @hash << location_hash
    end
  end

  def get_restaurant_dishes
    search
    @dishes = @dishes.sort_by{|d| d.restaurant_id == params[:rest_id].to_i ? 0 : 1}
  end
end
