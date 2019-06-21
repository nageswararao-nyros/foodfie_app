json.success 'Yes'
json.message 'Retrieved successfully.'
json.current_user_id current_user.id if current_user
json.min_price @min_price.floor
json.max_price @max_price.ceil
json.no_of_dishes @no_of_dishes 
json.no_of_dish_images @no_of_dish_images 
json.dish_images @dishImages do |image|
	json.id image.id
  json.user_id image.user_id
  json.user_name image.user.try(:username)
  json.user_image (image.user.profile_image.present? ? image.user.profile_image.secure_image(:original) : nil)
  json.image_url image.secure_image
  json.likes image.likes.size
  json.liked_by_user image.dish_likes.exists?(user_id: current_user.id) if current_user
  json.follows image.user.followers.include?(current_user) if current_user 
  json.dish do
  	json.(image.attachable, :id, :restaurant_id, :name, :description)
		price = image.attachable.price
		json.price (price % 1) > 0 ? price : price.to_i
		json.restaurant_name image.attachable.restaurant.try(:name)
		json.average_rating image.attachable.average_rating
		json.votes image.attachable.votes
		json.rating image.attachable.rating_by(current_user).try(:weight) if current_user and image.attachable
	end
	json.restaurant do
	  json.id image.attachable.restaurant_id
	  json.name image.attachable.restaurant.try(:name)
	  json.address image.attachable.restaurant.address_format
	  json.phone_number image.attachable.restaurant.try(:phone_number)
	  json.latitude image.attachable.restaurant.try(:latitude)
	  json.longitude image.attachable.restaurant.try(:longitude)
	end
	json.tags image.attachable.tags.map(&:name).map(&:upcase) if !@map_results

end
