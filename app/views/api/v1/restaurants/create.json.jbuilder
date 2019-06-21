json.success 'Yes'
json.message 'Restaurant was created successfully.'

json.restaurant do
  json.partial! @restaurant
end
