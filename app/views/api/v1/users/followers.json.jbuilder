json.success 'Yes'

json.followers @followers do |user|
  json.partial! user
  json.profile_image user.profile_image.try(:secure_image)
  json.followers user.followers.size
  json.follows user.followers.include?(current_user)
end