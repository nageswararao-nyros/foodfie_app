json.success 'Yes'
json.message 'Rerieved successfully.'

json.dishes @searched_dishes do |dish|
  json.partial! dish
end
