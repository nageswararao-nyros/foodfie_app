json.success 'Yes'
json.message "This user has #{@favourited_restaurants.size} favourited restaurant(s)."

json.restaurants @favourited_restaurants do |restaurant|
  json.partial! restaurant
end
