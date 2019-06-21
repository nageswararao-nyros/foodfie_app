json.success 'Yes'
json.message 'Rerieved successfully.'
json.un_rated_dishes @un_rated_dishes
json.dish do
  json.partial! @dish
  json.comments @comments do |comment|
    json.comment comment.context
    json.user do
      json.id comment.user.id
      json.first_name comment.user && comment.user.first_name && comment.user.first_name.upcase
      json.last_name comment.user.last_name
      json.name comment.user.name
      json.profile_image comment.user.profile_image.try(:secure_image)
      json.rating user_rating_in_int comment
      json.favourite @dish.favouriters.include?(comment.user)
      json.duration time_in_words(comment.updated_at)
    end
  end
end
