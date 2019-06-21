json.(restaurant, :id, :name, :phone_number, :rating, :latitude, :longitude)
json.address     	 restaurant.address_format.split(",")[0..2].join(",")
json.followed_by     restaurant.followed_by? current_user
json.favourited_by   restaurant.favourited_by? current_user
json.followers_count restaurant.followers.size
json.rating          restaurant.rating
json.votes           restaurant.votes
json.image			 restaurant.image && restaurant.image.secure_image
json.city			 restaurant.try(:city)
