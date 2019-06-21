ActiveAdmin.register Image, as: "DishImage" do
  menu label: "Dish Images", :priority => 8
  actions :index, :show, :destroy

  filter :images
  filter :dish_id, label: 'Dish Id'
  filter :dish_name, as: :string, label: 'Dish Name'
  filter :restaurant_id, label: 'Restaurant Id'
  filter :restaurant_name, :as => :string, label: 'Restaurant Name'
  filter :user_id, label: 'User Id'
  filter :user_username, :as => :string, label: 'User Name'
  filter :id, label: 'Releted Image Ids'

  controller do
    def scoped_collection
      super.where(attachable_type: 'Dish').includes(:attachable)
    end
  end

  index do
    selectable_column
    column 'Dish Image Id', :id
    column 'Dish Name', :attachable
    column 'Restaurant Id', :restaurant_id do |image|
      #link_to image.attachable.restaurant_id, admin_restaurant_path(image.attachable.restaurant_id)
    end
    column 'Restaurant Name', :restaurant_name do |image|
      #link_to image.attachable.restaurant.name, admin_restaurant_path(image.attachable.restaurant_id)
    end
    column 'User Id', :user_id do |image|
      #link_to image.user.id, admin_user_path(image.user.id)
    end
    column 'User Name', :user_id
    column 'Releted Image Ids' do |image|
      image_tag(image.secure_image(:thumb))
    end
    # column :image
    actions
  end
end
