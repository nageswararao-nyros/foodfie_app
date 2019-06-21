module ApplicationHelper
  def current_user
    # binding.pry
    authorization_header = request.headers['Authorization']
    if authorization_header
      token = authorization_header
      @current_user ||= User.find_by_authentication_token(token)
    end
  end

  def current_location
    session[:location] || {'city' => nil}
    # Geocoder.search('123.2.183.120').first.data ## SAMPLE for Testing
  end

  def location_name
    if current_location && current_location['city']
      [current_location['city'], current_location['region_code']].compact.reject(&:empty?)*', '
    else
      'Select Location'
    end

  end
end
