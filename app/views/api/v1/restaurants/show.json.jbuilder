json.success 'Yes'
json.message 'Rerieved successfully.'
json.un_rated_dishes @un_rated_dishes
json.restaurant do
  json.partial! @restaurant
  json.min_price @min_price.floor if @min_price
  json.max_price @max_price.ceil if @max_price
  json.dishes @dishes do |dish|
    json.partial! dish
  end
end
