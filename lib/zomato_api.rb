class ZomatoApi
  # API_KEY = 'fd6f18a835f5d77027c390e5f22103dd'
  API_KEY = 'fad7a7c721cc703b3089a6b7f260f1a2'
  class << self
    def location(name)
      p url = "http://developers.zomato.com/api/v2.1/locations?query=#{name}"
      response = HTTParty.get(url, headers: {'user-key' => API_KEY})
      json_response = response.as_json
      json_response["location_suggestions"].first
    end

    def restaurants_by_location(options = {})
      p url = "https://developers.zomato.com/api/v2.1/search?entity_id=#{options['entity_id']}&lat=#{options['latitude']}&lon=#{options['longitude']}"
      response = HTTParty.get(url, headers: {'user-key' => API_KEY})
    end
  end
end