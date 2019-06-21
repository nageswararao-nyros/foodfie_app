json.success 'Yes'
json.message 'You have successfully retrieved the user.'
json.un_rated_dishes @un_rated_dishes
json.user do
  json.(current_user, :id, :username, :first_name, :email)
  json.last_name current_user.last_name || ""
  json.cover_image current_user.cover_image.try(:secure_image)
  json.profile_image current_user.profile_image.try(:secure_image)
end