ActiveAdmin.register Rating do
  menu label: "Ratings", :priority => 10
  permit_params :user_id, :dish_id, :weight

  controller do
    def scoped_collection
      super.includes(:user, :dish)
    end
  end

  filter :user
  filter :dish
  filter :weight
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :user
    column :dish
    column :weight
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :user,
              collection: User.all.collect{|u| ["#{u.id}- #{u.name}", u.id]}
      f.input :dish,
              collection: Dish.all.collect{|d| ["#{d.id}- #{d.name}", d.id]}
      f.input :weight
    end
    f.actions
  end

end
