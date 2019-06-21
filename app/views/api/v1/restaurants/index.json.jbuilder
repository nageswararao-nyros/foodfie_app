json.success 'Yes'

json.restaurants @restaurants do |restaurant|
  # json.partial! restaurant
  json.(restaurant, :id, :name, :address, :phone_number, :rating, :latitude, :longitude)
  # json.followed_by     restaurant.followers_cnt.to_i > 0
  json.followed_by     restaurant.followed_by?(current_user)
  json.favourited_by   restaurant.favourited_by? current_user
  json.followers_count restaurant.followers.size
  json.rating          restaurant.rating
  json.votes           restaurant.votes
  json.image_url 	   restaurant.image && restaurant.image.secure_image
end
