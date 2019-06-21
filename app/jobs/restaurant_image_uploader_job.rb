class RestaurantImageUploaderJob < Struct.new(:restaurant)
  def perform
    @client = GooglePlaces::Client.new(Rails.application.secrets.google_places)
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

