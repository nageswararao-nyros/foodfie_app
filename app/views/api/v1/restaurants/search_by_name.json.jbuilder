json.success 'Yes'
json.message 'Rerieved successfully.'

json.restaurants @restaurants_search do |restaurant|
  json.id restaurant.fetch(:id)
  json.name restaurant.fetch(:name)
  json.locations restaurant.fetch(:locations)
end
