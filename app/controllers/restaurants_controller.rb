class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.where(id: params[:id]).includes({dishes: :images}).first
    @dishes = Dish.where(restaurant_id: @restaurant.id)
                           .filters(params)
                           .includes(:restaurant, :favouriters, :ratings, :images, :tags)
                           .group('dishes.id')
    @dishes = Dish.tags_filter(@dishes, params)
  end
end
