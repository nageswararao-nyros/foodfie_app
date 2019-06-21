ActiveAdmin.register User do
  menu :label => "Users", :priority => 4
  actions :index, :show, :edit, :update, :destroy

  permit_params :username, :first_name, :last_name, :email

  # remove_filter :users
  filter :users
    # filter :id, :as => :number
    filter :id, label: 'User Id'
    filter :username, :as => :string
    filter :first_name, :as => :string
    filter :last_name, :as => :string
    filter :email, :as => :string



  index do
    selectable_column
    column 'User Id', :id
    column :first_name
    column :last_name
    column :username
    column :email
    column 'Number of Posts', :no_of_post
    column 'Number of Followers', :no_of_followers 
    column 'Number of Following', :no_of_following
    column 'Followers'
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :username
      row :first_name
      row :last_name
      row :email
      row :no_of_post
      row :no_of_followers 
      row :no_of_following
      # row :followers
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs :username, :first_name, :last_name, :email
    f.actions
  end
end
