json.success 'Yes'
json.message 'This dish was added to your profile, head there to rate it.'

json.dish do
  json.partial! @dish
end
