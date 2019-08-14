json.success 'Yes'
json.message 'Rerieved successfully.'
json.min_price @min_price.floor
json.max_price @max_price.ceil
json.no_of_dishes @no_of_dishes
json.dishes @searched_dishes do |dish|
  json.partial! dish
  json.restaurant_rating dish.restaurant.rating
  json.dishes_count dish.restaurant.dishes.length
end
