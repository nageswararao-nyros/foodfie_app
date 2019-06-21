json.success 'Yes'
json.message 'Rerieved successfully.'
json.user_image @user_image
json.dishes @dishes do |dish|
  json.id dish.id
  json.name dish.name
  json.price dish.price
end
