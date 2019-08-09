json.success 'Yes'
json.message 'Restaurant was created successfully.'

json.restaurants do
  json.restaurants @restaurants
end

json.followers @restaurants do |res|
  json.followers res.followers.count
  json.restaurant_id res.id
end