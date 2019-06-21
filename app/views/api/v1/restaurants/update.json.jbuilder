json.success 'Yes'
json.message 'Restaurant was updated successfully.'

json.restaurant do
  json.partial! @restaurant
end
