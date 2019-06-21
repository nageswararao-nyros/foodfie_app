json.success 'Yes'

json.users @users do |user|
  json.partial! user
  json.follows @current_user_followers.include?(user)
  # json.following user.followers_cnt.to_i > 0
  json.following user.followers.include?(current_user)
  json.profile_image user.profile_image.try(:secure_image)
  json.followers user.followers.size
end
