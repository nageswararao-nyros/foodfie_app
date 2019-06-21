json.success 'Yes'
json.message 'Rerieved successfully.'

json.restaurants @restaurants do |restaurant|
  json.partial! restaurant
end

json.dishes @dishes do |dish|
  json.partial! dish
end
