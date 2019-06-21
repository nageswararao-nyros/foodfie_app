json.success 'Yes'
json.message 'Rerieved successfully.'

json.min_price @min_price.floor
json.max_price @max_price.ceil

json.no_of_dishes @no_of_dishes
json.no_of_restaurants @no_of_restaurants

json.dishes @searched_dishes do |dish|
  json.partial! dish
end

json.restaurants @restaurants do |restaurant|
  json.partial! restaurant
end