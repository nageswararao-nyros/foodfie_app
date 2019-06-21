json.success 'Yes'
json.message "This user has #{@followed_restaurants.count} followed restaurant(s)."

json.restaurants @followed_restaurants do |restaurant|
  json.partial! restaurant
end
