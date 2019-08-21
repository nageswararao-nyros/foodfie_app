class Api::V1::DishesController < ApplicationController

 include PushNotificationUtils
  # before_action :restrict_access
  before_action :set_dish, except: [:create, :search, :search_by_name, :feed, :restaurant_search]
  #before_action :is_active_user, only: :create
  before_action :un_rated_dishes, only: [:show]
  before_action :check_price, only: [:create]

  def create
    # binding.pry
    @reposted = true
    if params[:dish_id].present?
      @dish = Dish.find_by_id(params[:dish_id])
      if @dish.nil?
        return render json: { success: 'No', message: 'Invalid Dish details.' }, status: 422
      else
        if @dish.name != dish_params[:name]
          @reposted = false
          @dish = current_user.dishes.new(dish_params)
        else
          @dish.attributes = dish_params
        end
      end
    else
      existing_dish = Dish.find_by(name: dish_params[:name])
      if existing_dish.present?
        @dish = existing_dish
        @dish.attributes = dish_params.except(:restaurant_id)
      else
        @reposted = false
        @dish = current_user.dishes.new(dish_params)
      end
    end
    if @dish.valid?
      restaurant_id = lookup_or_create_restaurant
      if restaurant_id.nil?
        return render json: { success: 'No', message: "Cannot save dish because restaurant not found or cannot add new restaurant" }
      end
      if @dish.restaurant_id.blank? or @dish.restaurant_id != restaurant_id
        existing_dish = Dish.find_by(name: dish_params[:name], restaurant_id: restaurant_id)
        if existing_dish.present?
          @dish = existing_dish
          @dish.attributes = dish_params
        else
          @dish = current_user.dishes.new(dish_params)
          @dish.restaurant_id = restaurant_id
          @reposted = false
          @dish.save
          if @dish
            # message = { title: "New dish added in Foodfie", body: "Lets try !!!!!!!!!!"}
            # subscriptions = Subscription.all
            @dish_res = @dish.restaurant.name
            # subscriptions.each do |subscriber|
            #   begin
            #     Webpush.payload_send(
            #       endpoint: subscriber.endpoint,
            #       message: JSON.generate(message),
            #       p256dh: subscriber.p256dh,
            #       auth: subscriber.auth,
            #       vapid: {
            #         subject: "mailto:sender@example.com",
            #         public_key: 'BGaBmbHJz7l_KvpfcPLCDCfY6kQZtDRRFGSjp8YV7j4tG6s7yTHRvL4up1dFIyfMhCJYFn_Op5F_KkuI9mHPPJ0',
            #         private_key: 'XfX_OWSXUIpldH0UwtWJY8QALCpDOyrg3fWOhRilKqI'
            #       }
            #     )
            #   rescue => e
            #     puts "Subscription error"
            #   end
            # end
            # binding.pry
            
            Delayed::Job.enqueue( SendPushNotificationsJob.set(wait: 30.seconds).perform_later @dish_res )
            # Delayed::Job.enqueue(WebPushJob.new(subscriptions, dish))
          end
        end
      end
      if @dish.restaurant_id.present?
        if params[:image_content_type].present? and params[:image].present?
          image_content_types = %w(image/jpeg image/jpg image/png image/gif)
          image_content_type = params[:image_content_type]
          return render json: { success: 'No', message: "Image content type should be from #{image_content_types*', '}."}, status: 422 if image_content_types.exclude?(image_content_type)
          image_param = params[:image]
        end
        @dish.name = @dish.name
        if @dish.save
          type = 'dish'
          type_id = @dish.id
          title = "New Dish!"
          message = "New Dish is added by #{current_user.first_name}"
          registration_ids = current_user.followers.pluck(:device_id)
          if registration_ids
            Delayed::Job.enqueue(SendNotificationJob.new(type, type_id, title, message, registration_ids.uniq))
          end
        end
        if @dish.users.exclude? current_user
          dish_user = DishesUser.find_or_create_by(dish_id: @dish.id, user_id: current_user.id )
          dish_user.reposted = @reposted
          dish_user.save
        end
        if params[:image_content_type].present? and params[:image].present?
          image_name = params[:image_name]
          Image.save_dish_image(current_user, @dish, image_content_type, image_param, image_name )
        end
        respond_to :json
      else
        render json: { success: 'No', errors: 'There was an error getting restaurant by name.', message: 'Dish could not be saved.' }, status: 422
      end
    else
      render json: { success: 'No', errors: @dish.errors.messages, message: 'Dish could not be saved.' }, status: 422
    end
  end

  def update
    # binding.pry
    if @dish.update_attributes(dish_params)
      # @image = Image.update_dish_
      image_content_type = params[:image_content_type]
      image_param = params[:image]
      image_name = params[:image_name]
      image_id = params[:image_id]
      Image.update_dish_image(current_user, @dish, image_content_type, image_param, image_name, image_id) if params[:image_id].present?
      if params[:image_id].nil?
        Image.save_dish_image(current_user, @dish, image_content_type, image_param, image_name )
      end
      respond_to :json
    else
      render json: { success: 'No', dish: @dish.errors.messages, message: 'Dish could not be updated successfully.' }, status: 422
    end
  end

  def show
    if @dish
      @is_other_user = params[:user_id].present?
      @user = @is_other_user ? User.find_by_id(params[:user_id]) : current_user
      comments = @dish.comments.order('created_at DESC').page(page).per(limit)
      current_user_comments = comments.collect { |c| c if c.user_id == @user.id }.compact
      other_user_comments = comments - current_user_comments
      @comments = (current_user_comments + other_user_comments).flatten.uniq
      respond_to :json
    else
      render json: { success: 'No', message: 'There was an error getting the dish you requested.'  }, status: 422
    end
  end

  def destroy
    if @dish && @dish.destroy
      render json: { success: 'Yes', message: 'Dish has successfully been destroyed.' }, status: 200
    else
      render json: { success: 'No', message: 'Dish has not been destroyed.' }, status: 422
    end
  end

  def favourite
    # binding.pry
    if @dish.get_favourited_by(current_user.id)
      type = 'dish'
      type_id = @dish.id
      title = "Dish Liked"
      message = "Hey someone liked the dish you posted"
      registration_ids = [@dish.dishes_users.where(:reposted => false).first.user.device_id]
      #send_notifications(type, type_id, title, message, registration_ids)
      Delayed::Job.enqueue(SendNotificationJob.new(type, type_id, title, message, registration_ids))
      render json: { success: 'Yes', message: 'You successfully favourited the dish.' }, status: 200
    else
      render json: { success: 'No', message: 'You didn\'t favourite the dish.' }, status: 500
    end
  end

  def unfavourite
    # binding.pry
    if @dish.get_unfavourited_by(current_user.id)
      render json: { success: 'Yes', message: 'You successfully unfavourited the dish.' }, status: 200
    else
      render json: { success: 'No', message: 'You didn\'t unfavourite the dish.' }, status: 500
    end
  end

  def favouriters
    if @dish.favouriters.present?
      render json: { success: 'Yes', favouriters: @dish.favouriters, message: "This dish has #{@dish.favouriters.count} favouriter(s)." }, status: 200
    else
      render json: { success: 'Yes', message: 'This user has no favouriters.', favouriters: nil }, success: 200
    end
  end

  def search
    # binding.pry
    search_results
  end

  def restaurant_search
    restaurant_page = params[:restaurant_page] || page
    restaurant_limit = params[:restaurant_limit] || limit
    locations = Geocoder.search(params[:location])
    location = locations[0].geometry['location']
    box = Geocoder::Calculations.bounding_box([location['lat'], location['lng']], 20, {units: :km})
    @restaurants = Restaurant.search_results(box, params[:search])
    @no_of_restaurants = @restaurants.length
    if @restaurants.blank?
      render json: { success: 'Yes', message: 'Sorry, your search matched with no restaurants. Please try something else.', restaurants: []}
    else
      @restaurants = Kaminari.paginate_array(@restaurants).page(restaurant_page).per(restaurant_limit)
      respond_to :json
    end
  end

  # Ios serach results
  def ios_search
    search_data
    restaurant_search_data
    if @searched_dishes.blank? && @restaurants.blank?
      render json: { success: 'Yes', message: 'Sorry, your search matched with no records. Please try something else.', restaurants: nil, dishes: nil}
    else
      respond_to :json
    end
  end

  def map_results
    search_results
  end

  def search_by_name
    # binding.pry
    restaurant = Restaurant.where(name: params[:restaurant_name]).first
    @user_image = params[:image_id].present? ? Image.where(id: params[:image_id], user: current_user).present? : false
    if restaurant
      @dishes = restaurant.dishes.search_by_name(params[:search]).uniq
    else
      @dishes = []
    end
    if @dishes.blank?
      render json: { success: 'Yes', message: 'Sorry, your search matched with no records. Please try something else.', dishes: nil}
    else
      respond_to :json
    end
  end

  def is_active_user
    if current_user.activated
      return render json: { activated: true}, status: 200
    else
      return render json: { activated: false, message: "We’ll need you to verify your email before you post anything.\nTo do this, click on the link in the email we sent you.", mail_confirmation: true}, status: 200
    end
  end

  def feed
    # binding.pry
    dish_page = params[:dish_page] || page
    dish_limit = params[:dish_limit] || limit
    @min_price = 0
    @max_price = 0
    @feed = []
    if params[:location]
      locations = Geocoder.search("#{params[:location]}")
      if locations.present?
        restaurants_q = restaurants_quary(locations)
        dishes = Dish.includes(:restaurant, :ratings, :images)
                     .where("restaurant_id IN (#{restaurants_q})")
                     .search(params[:search])
                     .filters(params)

        if dishes.length == 0
          render json: { success: 'Yes', message: 'Sorry, your search matched with no records. Please try something else.', dishes: [], current_user_id: current_user.id}
        end
        @min_price = dishes.minimum(:price).to_i
        @max_price = dishes.maximum(:price).ceil if dishes.maximum(:price)
        # Tags
        is_by_tags ? dishes = Dish.tags_filter(dishes, params) : nil
        # Distance
        dishes = dishes.order(created_at: :desc).group('dishes.id')
        @feed = within_range(dishes)
        @feed = dishes_with_present_image(@feed)
        @no_of_dishes = @feed.length
        if params[:sort_by].nil?
          @dishImages = Image.where(attachable_id: @feed.collect(&:id), attachable_type: "Dish").order(created_at: :desc)
        else
          @dishImages = Image.where(attachable_id: @feed.collect(&:id), attachable_type: "Dish")
          ids = @feed.collect(&:id)
          ids_users = {}
          @dishImages.each {|dish| ids_users[dish.attachable_id] = dish}
          @dishImages = ids.collect{ |id| ids_users[id] }
        end
        @no_of_dish_images = @dishImages.length
        @dishImages = Kaminari.paginate_array(@dishImages).page(dish_page).per(dish_limit) if @dishImages
      end
    end
    if @feed.blank?
      render json: { success: 'Yes', message: 'Sorry, your search matched with no records. Please try something else.', dishes: [], current_user_id: current_user.id}
    else
      respond_to :json
    end
  end

  private
  #where(restaurants: {city: city})
  def search_results
    # binding.pry
    dish_page = params[:dish_page] || page
    dish_page = params[:dish_page] || page
    dish_limit = params[:dish_limit] || limit
    city = params[:location].split(",")[0].downcase
    @min_price = 0
    @max_price = 0
    @searched_dishes = []
    restaurants_q = restaurants_quary_dish(city)
    dishes = Dish.includes(:restaurant, :ratings, :images, :favouriters, :tags)
              .where("restaurant_id IN (#{restaurants_q})")
              .search(params[:search])
              .filters(params)
    dishes = dishes.group('dishes.id')
    is_by_tags ? dishes = Dish.tags_filter(dishes, params) : nil
    @no_of_dishes = dishes.length if dishes
    @searched_dishes = Kaminari.paginate_array(dishes).page(dish_page).per(dish_limit) if dishes
    if @searched_dishes.blank?
      render json: { success: 'Yes', message: 'Sorry, your search matched with no dishes. Please try something else.', dishes: []}
    else
      respond_to :json
    end
  end

  # def lookup_or_create_restaurant
  #   begin
  #     restaurant = Restaurant.get_by_name(restaurant_params[:name])
  #     return restaurant.id if restaurant.present?
  #     if restaurant.nil?
  #       return restaurant = nil
  #       # render json: { success: 'No', message: 'Restaurant Not Found Here' }
  #     end
  #   rescue ActiveRecord::RecordNotFound => e
  #     puts e
  #   end
  # end

  def lookup_or_create_restaurant
    # binding.pry
    restaurant = Restaurant.lookup_by_lat_lng(params[:restaurant][:latitude], params[:restaurant][:longitude])
    if restaurant.nil?
      restaurant_by_name = Restaurant.find_by_name(params[:restaurant][:name])
      if restaurant_by_name
        return restaurant_by_name.id
      end
      # phone_number = Restaurant.get_phone_number(params[:restaurant][:google_place_id])
      # params[:restaurant][:phone_number] = phone_number
      restaurant = Restaurant.new(restaurant_params)
      restaurant.save!
    end
    if !restaurant.google_place_id.present?
      restaurant.google_place_id = params[:restaurant][:google_place_id]
      restaurant.save
    end
    (!restaurant.nil? && !restaurant.id.nil?) ? restaurant.id : nil
  end

  def restaurants_quary(locations)
    location = locations[0].geometry['location']
    box = Geocoder::Calculations.bounding_box([location['lat'], location['lng']], 10, {units: :km})
    restaurants_q = Restaurant.within_bounding_box(box).select('id').to_sql
  end

  def restaurants_quary_dish(city)
    restaurants_q = Restaurant.where(city: city).select('id').to_sql
  end

  def within_range(data)
    results = []
    range = params[:distance_range].to_i > 0 ? params[:distance_range].to_i : 10
    location = Geocoder.coordinates("#{params[:location]}")
    data.each do |dish|
      restaurant = dish.class.name == "Dish" ? dish.restaurant : dish
      distance = Geocoder::Calculations.distance_between(location, restaurant, {units: :km})
      dish.distance = distance
      next if distance > range
      results << dish
    end
    is_by_distance ? results = results.sort_by {|x| [x.distance, -x.id]} : nil
    params[:sort_by].nil? ? results = results.sort_by {|x| -x.id} : nil
    results
  end

  def dishes_with_image(dishes)
    dishes.sort_by {|dish| dish.images.present? ? 0 : 1}
  end

  def dishes_with_present_image(dishes)
    dishes.select {|dish| dish.images.present?}
  end

  def set_dish
    @dish = Dish.joins(:restaurant).find_by_id(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :price, :description)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :latitude, :longitude, :google_place_id, :phone_number)
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column(klass)
    klass.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def check_price
    params[:dish][:price] = params[:dish][:price].present? ? params[:dish][:price] : 0
  end

end
