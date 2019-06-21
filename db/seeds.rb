# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# AdminUser.create!(email: 'messagelien@gmail.com', password: 'password&123', password_confirmation: 'password&123')
# AdminUser.create!(email: 'arslanaly47@gmail.com', password: 'password&123', password_confirmation: 'password&123')
# AdminUser.create!(email: 'nageswararao.nyros@gmail.com', password: 'password@123', password_confirmation: 'password@123')

dishes = Dish.all
tag = Tag.where(name: "VEGETARIAN")
dishes.each do |dish|
  dish.tags.each do |tag|
    if tag.name == "VEGAN"
      veg = dish.tags.pluck(:name).include?("VEGETARIAN")
      if !veg
        dish.tag_list.add("VEGETARIAN")
        dish.save
      end
    end
  end
end

users = User.all
users.each do |user|
	user.activation_token = SecureRandom.urlsafe_base64.to_s
	user.save
end

# restaurants = Restaurant.all
# @client = GooglePlaces::Client.new("AIzaSyBxBIfFGmL6adUEtytF2IYA10JZjQc5_sk")
# restaurants.each do |rest|
#   if !rest.phone_number.present? && rest.latitude && rest.longitude
#     result = @client.spots(rest.latitude, rest.longitude, :name => rest.name, :types => 'restaurant')
#     place_id = result.first.place_id if result.first
#     if place_id
#       details = HTTParty.get "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=AIzaSyCujRZ4ZbTufNTlCSex1xzj0maeYYigPBU"
#       phone_number = details["result"]["formatted_phone_number"]
#       rest.phone_number = phone_number
#       rest.save
#     end
#   end
# end

users = User.all
users.each do |user|
	user.email = user.email.downcase
	user.save
end

restaurants = Restaurant.all
restaurants.each do |res|
	res.google_place_id = nil
	res.save
end


require 'csv'

# # Restaurants

csv_text = File.read(Rails.root.join('lib', 'seeds', 'rowena_copy_sheet.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# ActiveRecord::Base.transaction do

# # 	# Create admin user

# 	# AdminUser.create!(email: 'chaitanya_nyros@yahoo.com', password: 'password', password_confirmation: 'password')

# # 	# Create tags

# 	["STARTER", "MAIN", "DESSERT", "DRINK","VEGETARIAN", "VEGAN", "GLUTEN FREE"].each do |tag|
# 		Tag.create!(name: tag)
# 	end

# # 	# Create user

# 	@user = User.create!(username: "Peppa", first_name: "Peppa", last_name: "team", email: "hello@peppa.io", activated: true, password: "Password123", password_confirmation: "Password123")

# 	@tags = ["Starter", "Main", "Dessert", "Drink", "Vegetarian", "Vegan", "Gluten Free"]
# 	csv.each do |row|
# 	  	restaurant =  Restaurant.where(latitude: row["Lattitude"], longitude: row["Longitude"]).first
# 	  	if restaurant.nil? && !row["Lattitude"].nil? && !row["Lattitude"].nil?
# 		  	restaurant = Restaurant.new
# 		  	restaurant.name = row["Name"]
# 		  	restaurant.address = row["Address"]
# 		  	restaurant.phone_number = row["Phone number"]
# 		  	restaurant.latitude = row["Lattitude"]
# 		  	restaurant.longitude = row["Longitude"]
# 		  	restaurant.website = row["Website"]
# 		  	restaurant.save
# 		end
# 		if !restaurant.nil?
# 			dish = Dish.new
# 			dish.restaurant_id = restaurant.id
# 			dish.name = row["Dish Name"]
# 			dish.price = row["Price"].split("$")[1] if row["Price"]
# 			dish.description = row["Dish description"]
# 			if dish.save
# 				dish.dishes_users.create!(user_id: @user.id, dish_id: dish.id)
# 			end
# 			@tags.each do |tag|
# 				if row[tag]
# 					dish.tag_list.add(tag.upcase)
# 					dish.save
# 				end
# 			end
# 		end
# 		puts "#{row["Dish Name"]}"
# 	end

# end

# Get google places ids

@client = GooglePlaces::Client.new(Rails.application.secrets.google_places)
restaurants = Restaurant.all

restaurants.each do |res|
	lat = res.latitude
	long = res.longitude
	name = res.name
	if !res.google_place_id.present?
		place = @client.spots(lat, long, :name => name)
		if place[0].present?
			res.google_place_id = place[0].place_id
			res.save
		end
	end
end

#Post the image into database

restaurants.each do |restaurant|
if !restaurant.image.present?
@spot = @client.spot(restaurant.google_place_id)
@url = @spot.photos.present? && @spot.photos[0].fetch_url(800)
restaurant_image = Image.new(attachable_id: restaurant.id, attachable_type: restaurant.class.name)
if @url.present?
restaurant_image.image = open(@url)
restaurant_image.image_file_name = "#{Time.current.to_i}"
if restaurant_image.valid?
restaurant_image.save
end
end
end
end

cities = ["Agartala", "Aizawl", "Bengaluru", "Bhopal", "Bhubaneswar", "Chandigarh", "Chandigarh", "Chennai", "Dehradun", "Dispur", "Gandhinagar", "Gangtok", "Delhi", "Imphal", "Itanagar", "Jaipur", "Kohima", "Kolkata", "Lucknow", "Mumbai", "Panaji", "Patna", "Raipur", "Ranchi", "Shillong", "Shimla", "Srinagar", "Thiruvananthapuram", "Jammu", "Delhi", "Ooty", "Goa", "Tirupati", "Pondicherry", "Nainital"]
@client = GooglePlaces::Client.new('AIzaSyBqHbsj79VsUPBoHeJdu9TmKGf2jWH3NhU')
cities.each do |city|
  city = city
  restaurants = @client.spots_by_query("restaurants near #{city}", multipage: true, :types => ['restaurant','food'], :exclude => ['bar', 'meal_takeaway'])
  restaurants.each do |restaurant|
    place = restaurant.place_id
    @spot = @client.spot(place)
    name = @spot.name
    address = @spot.formatted_address
    phone_number = @spot.formatted_phone_number
    latitude = @spot.lat
    longitude = @spot.lng
    website = @spot.website
    image = @spot.photos[0] && @spot.photos[0].fetch_url(800)
    rating = @spot.rating
    restaurant = Restaurant.new()
    restaurant.name = name
    restaurant.address = address
    restaurant.phone_number = phone_number
    restaurant.latitude = latitude
    restaurant.longitude = longitude
    restaurant.google_place_id = place
    restaurant.website = website
    restaurant.rating = rating
    restaurant.city = city
    if restaurant.save
      restaurant_image = Image.new(attachable_id: restaurant.id, attachable_type: restaurant.class.name)
      if image.present?
        restaurant_image.image = open(image)
        restaurant_image.image_file_name = "#{Time.current.to_i}"
        if restaurant_image.valid?
          restaurant_image.save
        end
      end
    end
  end
end

# Dishes scraping

doc = Nokogiri::HTML(open('http://havelikakinada.com/Menu.aspx', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
entries = doc.css('.bs-docs-example')

CSV.open("dishes.csv", "w") do |csv|
  entries.each do |entry|
    dishes = entry.css('table')[0].css('tbody')[0].css('tr')
    dishes.each do |dish|
      type = dish.parent.parent.css('thead').css('tr').css('th')[1].text
      type2 = dish.parent.parent.parent.xpath("preceding-sibling::h2").last.text
      type2 += ',' + type
      dd = dish.css('td')[1].text
      csv << [dd, type2]
    end
  end
end

# Dishes Create

csv_text = File.read(Rails.root.join('dishes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  dish = Dish.new
  dish.name = row['name']
  dish.price = 0
  dish.tag_list.add(row['tags'].split(',').map{|tag| tag.upcase})
  dish.save!
end

ids = Restaurant.where(:city => "Kakinada").pluck(:id)
Dish.all.each do |dish|
  dish.restaurant_id = ids.sample
  dish.save!
end

csv_text = File.read(Rails.root.join('dishes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  dish = Dish.where(name: row['name']).first
  dish_image = Image.new(attachable_id: dish.id, attachable_type: dish.class.name)
  dish_image.image = open(row['url'])
  dish_image.save!
end

app = Rpush::Gcm::App.new
app.name = "foodfie"
app.auth_key = "AIzaSyBb34EWGQzOKJi4FnVW-QuljaMRMaKF5nY"
app.connections = 1
app.save!

dishes = Dish.all
user = User.where(:username => "foodfie").first
dishes.each do |dish|
  dish_user = DishesUser.new
  dish_user.user_id = user.id
  dish_user.dish_id = dish.id
  dish_user.reposted = false
  dish_user.save!
end

images = Image.all
user = User.where(:username => "foodfie").first
images.each do |image|
  image.user_id = user.id
  image.save!
end

dishes = Dish.all
user = User.where(:username => "foodfie").first
dishes.each do |dish|
dish.ratings.new(:user_id => user.id, dish_id: dish.id, weight: 0)
dish.save!
end
