json.success 'Yes'
json.message "This user has #{@favourited_dishes.size} favourited dish(es)."
json.un_rated_dishes @un_rated_dishes
json.min_price @min_price.floor
json.max_price @max_price.ceil
json.dishes @favourited_dishes do |dish|
  json.partial! dish
end
