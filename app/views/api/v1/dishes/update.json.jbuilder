json.success 'Yes'
json.message 'Dish was updated successfullly.'

json.dish do
  json.partial! @dish
end
