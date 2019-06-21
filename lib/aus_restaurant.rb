class AusRestaurant
  class << self
    def get_zomato_restaurants
      restaurants = Restaurant.all
      Ausburbs.state_names.each do |state_name|
        suburbs = Ausburbs.state(state_name).suburbs.uniq{|s| s.name }
        suburbs.each do |ausburbs|
          location_name = ausburbs.name + ', ' + ausburbs.state
          location = ZomatoApi.location(location_name)
          next if location.nil?
          zomato_restaurants = ZomatoApi.restaurants_by_location(location)
          if(zomato_restaurants['results_found'].to_i > 0)
            zomato_restaurants['restaurants'].each do |zomato_restaurant|
              columns = {}
              columns[:name] = zomato_restaurant['restaurant']['name'].to_s.strip
              columns[:address] = zomato_restaurant['restaurant']['location']['address'].to_s.strip
              columns[:phone_number] = zomato_restaurant['restaurant']['phone_numbers']
              p columns
              if restaurants.select{|rest| rest if rest.slice(:name, :address, :phone_number).symbolize_keys == columns}.compact.empty?
                restaurant = Restaurant.create(columns)
                restaurant.latitude = zomato_restaurant['restaurant']['location']['latitude'].to_f if restaurant.latitude.blank?
                restaurant.longitude = zomato_restaurant['restaurant']['location']['longitude'].to_f if restaurant.longitude.blank?
                restaurant.save
                restaurants << restaurant
              end
            end
          end
        end
        # break
      end
    end
  end
end