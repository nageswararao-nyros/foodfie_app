json.success 'Yes'
json.message 'Rerieved successfully.'
json.no_of_restaurants @no_of_restaurants
json.restaurants @restaurants do |restaurant|
  json.partial! restaurant
end