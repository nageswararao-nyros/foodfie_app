ActiveAdmin.register Restaurant do
  menu :label => "Restaurants", :priority => 5
  permit_params :name, :address, :phone_number

  # remove_filter :restaurants
  filter :restaurants
  filter :id, label: 'Restaurant Id'
  filter :name, :as => :string, label: 'Restaurant Name'
  filter :address, :as => :string
  filter :phone_number, :as => :string


  index do
    selectable_column
    column 'Restaurant Id', :id
    column 'Restaurant Name', :name
    column :address
    column :phone_number
    column 'Number of Followers', :no_of_followers 
    column 'Number of Dishes', :no_of_dishes 
    column 'Average Rating', :avg_rating
    # column :latitude
    # column :longitude
    # column :followers do |restaurant|
    #   restaurant.followers.map(&:username).join(',')
    # end
    # column :favouriters 
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs :name, :address, :phone_number
    f.actions
  end
end
