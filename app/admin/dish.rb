ActiveAdmin.register Dish do
  menu :label => "Dishes", :priority => 6
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :name, :price, :description, :restaurant_id, tag_ids: []

  controller do
    def scoped_collection
      super.includes(:tags)
    end
  end

  filter :dishes
    filter :id, label: 'Dish Id'
    filter :name, :as => :string, label: 'Dish Name'
    filter :restaurant_id,  label: 'Restaurant Id'
    filter :restaurant_name, :as => :string, label: 'Restaurant Name'
    filter :images_id,  label: 'Image Ids'
    filter :tags, collection: proc { Tag.all.map{ |c| [c.name, c.id] } }
    filter :description, :as => :string

  # filter :restaurant
  # filter :tag
  # filter :name
  # filter :price
  # filter :description
  # filter :created_at
  # filter :updated_at

  index do
    selectable_column
    column 'Dish Id', :id
    column 'Dish Name', :name
    # column 'Restaurant Id', :restaurant_id do |dish|
    #   link_to dish.restaurant.id, admin_restaurant_path(dish.restaurant.id)
    # end
    # column 'Restaurant Name', :restaurant_id
    column :price
    column 'Average Rating', :avg_rating

    column 'Image IDs', :image do |dish|
      dish.images.map(&:id).join(", ")
    end
    column :tags do |dish|
      dish.tags.map(&:name).join(', ')
    end
    column :description
    column :created_at
    column :updated_at
    column :report
    actions
  end

  form do |f|
    f.inputs do
      f.input :restaurant
      f.input :name
      f.input :price
      f.input :tags,
              as: :check_boxes,
              multiple: :true,
              collection: ActsAsTaggableOn::Tag.all

      f.input :description
    end
    f.actions
  end

end
