json.(dish, :id, :restaurant_id, :name, :description)
price = dish.price
json.price (price % 1) > 0 ? price : price.to_i
json.restaurant_name dish.restaurant.try(:name)
json.average_rating dish.average_rating
json.votes dish.votes
if @dishes
  json.rating dish.rating_by(@user).try(:weight)
  json.comment dish.comment_by(current_user).try(:context) if current_user
  json.favourite dish.favourited_by?(@user)
  if params[:action] == 'profile' && @user == current_user
    image = dish.images.sort_by{|d| -d.id}.select{|i| i if i.user_id == @user.id}.compact.first
  end
  if image.nil? && @view != "restaurant_profile"
    image = dish.images.sort_by{|d| -d.id}.select{|i| i if i.user_id == @user.id}.compact.first
    image = dish.images.sort_by{|d| -d.id}.first if image.nil?
  end

  if @view == "restaurant_profile"
    image = dish.images.sort_by{|d| -d.id}.first
  end

  json.image do
    json.id image.id
    json.user_id image.user_id
    json.user_name image.user.try(:username)
    json.image_url image.secure_image
  end if image
else
  json.rating dish.rating_by(current_user).try(:weight) if current_user
  json.favourited_by dish.favourited_by? current_user
  imgs = @user.present? && params[:view] != "results" ? dish.images.sort_by{|d| d.user_id == @user.id ? 0 : 1} : dish.images.sort_by{|d| -d.id}
  json.images imgs do |image|
    json.id image.id
    json.user_id image.user_id
    json.user_name image.user.try(:username)
    json.image_url image.secure_image
  end
end
json.restaurant do
  json.id dish.restaurant_id
  json.name dish.restaurant.try(:name)
  json.address dish.restaurant.address_format.split(",")[0..2].join(",")
  json.phone_number dish.restaurant.try(:phone_number)
  json.latitude dish.restaurant.try(:latitude)
  json.longitude dish.restaurant.try(:longitude)
  json.city dish.restaurant.try(:city)
end
json.tags dish.tags.map(&:name).map(&:upcase) if !@map_results