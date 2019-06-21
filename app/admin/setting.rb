ActiveAdmin.register Setting do
  menu :label => "Settings", :priority => 10
  before_action :skip_sidebar!, :only => :index
  permit_params :share_text, :google_places_api, :google_maps_api

	index do
    	selectable_column
    	column 'Share Text', :share_text
    	column 'Google Places API', :google_places_api
    	column 'Google Maps API', :google_maps_api
    	actions
 	end
end
