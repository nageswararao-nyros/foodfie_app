class HomeController < ApplicationController
  def landing_page
    string=[1,0,0,0,1,1,0,0,0,0,1]
    res_ary = []
    string.each_with_index do |str, index|
      string.each_cons(index+1) do |sub_str|
        a = (sub_str.include? 1) ? 0 : sub_str.length
        res_ary << a if a>0
      end
    end
    res_ary.max
  end

  def get_methods(arry)
    arry.each do |ele|
      if ele.class.to_s == "Array"
        ele.each do |el|
          @reslt_ary << el
        end
      else
        @reslt_ary << ele
      end
    end
    
    return @reslt_ary
  end

  def index
    params[:limit] = 6
    options = {sort_by: 'rating'}
    conditions = ''
    if current_location['city'].present?
      locations = Geocoder.search("#{current_location['city']}, #{current_location['region_code']}")
      # if locations.empty?
      #   session[:location] = request.location.data
      #   locations = Geocoder.search("#{current_location['city']}, #{current_location['region_code']}")
      # end
      unless locations.empty?
        location = locations[0].geometry['location']
        box = Geocoder::Calculations.bounding_box([location['lat'], location['lng']], 10, {units: :km})
        restaurants = Restaurant.within_bounding_box(box).select('id').to_sql
        conditions = "restaurant_id IN (#{restaurants})"
      end
    end
    @dishes = Dish.where(conditions)
                  .includes(:restaurant, :images, :ratings)
                  .filters(options)
                  .group('dishes.id')
                  .page(page).per(limit)
    tags = Tag.includes(:taggings)
    taggings = Tagging.where(tag_id: tags.map(&:id))
    @tagged_dishes = []
    @dish_tags = {}
    tags.each do |tag|
      # dish_ids = tag.taggings.where(taggable_type: 'Dish').map(&:taggable_id)
      dish_ids = taggings.collect{|tagging| tagging if tagging.tag_id == tag.id && tagging.taggable_type == 'Dish'}.compact.map(&:taggable_id)
      next if dish_ids.empty?
      dish = Dish.where(conditions).filters(options).where(id: dish_ids).group('dishes.id').includes(:images).order('created_at DESC').first
      next if dish.nil?
      @tagged_dishes << dish
      @dish_tags[dish.id] = [] if @dish_tags[dish.id].nil?
      @dish_tags[dish.id] << tag.name.upcase
    end
    @tagged_dishes.uniq!
  end

  def location_search
    if params[:location].present?
      suburbs = []
      Ausburbs.state_names.each do |state_name|
        ausburbs = Ausburbs.state(state_name).suburbs.select{|n| n.name.start_with?(params[:location].split(',').first.strip.upcase)}
        ausburbs.each do |ausburb|
          suburbs << {name: format('%s, %s', ausburb.name, ausburb.state), latitude: ausburb.latitude, longitude: ausburb.longitude}
        end
      end
      suburbs.uniq!{|s| s[:name] }
      suburbs.sort_by!{|s| s[:name] }
      location_found = suburbs.find{|suburb| suburb[:name] == params[:location].upcase}

      if location_found
        session[:location] = {'city' => params[:location].split(',').first.strip, 'region_code' => params[:location].split(',').last.strip}
      else
        session[:location] = nil
      end
    end

    redirect_to action: :index
  end

  def suburbs
    suburbs = []
    Ausburbs.state_names.each do |state_name|
      ausburbs = Ausburbs.state(state_name).suburbs.select{|n| n.name.start_with?(params[:keyword].upcase)}
      ausburbs.each do |ausburb|
        suburbs << {name: format('%s, %s', ausburb.name, ausburb.state), latitude: ausburb.latitude, longitude: ausburb.longitude}
      end
    end
    suburbs.uniq!{|s| s[:name] }
    suburbs.sort_by!{|s| s[:name] }
    return render json: suburbs
  end
end
