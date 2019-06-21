json.(@user, :id, :name, :username)
json.cover_image (@user.cover_image.present? ? @user.cover_image.secure_image(:original) : nil)
json.profile_image (@user.profile_image.present? ? @user.profile_image.secure_image(:original) : nil)
json.followers @user.followers.size
json.un_rated_dishes @un_rated_dishes
if @is_other_user
  json.follows @user.followers.include?(current_user)
else
  json.followings @user.followings.size + @user.followed_restaurants.size
end
json.min_price @dishes.empty? ? 0 : @dishes.sort_by{|d| d.price}.first.price.floor
json.max_price @dishes.empty? ? 0 :@dishes.sort_by{|d| d.price}.last.price.ceil
json.dishes @dishes do |dish|
  json.partial! dish
  json.reposted dish.reposted(current_user)
end
json.badges @badges
