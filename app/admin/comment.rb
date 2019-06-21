ActiveAdmin.register Comment, as: "UserComment" do
  actions :index, :show, :destroy
  menu label: "Comments", :priority => 7

  controller do
    before_action { @page_title = "Comments" }
  end

  # remove_filter :comments
  filter :comments
    filter :id, label: 'Comment Id'
    filter :user_id,  label: 'User Id'
    filter :user_username, :as => :string, label: 'User Name'
    filter :commentable_type, as: :string, label: 'Dish Name'
    filter :context, as: :string, label: 'Comment'
    filter :image_id, label: 'Image Id'



  controller do
    def scoped_collection
      super.includes(:commentable)
    end
  end

  index do
    selectable_column
    column 'Comment Id', :id
    column 'User Id',:user_id do |comment|
      link_to comment.user.id, admin_user_path(comment.user.id)
    end

    column 'User Name', :user_id 
    column 'Dish Name', :commentable
    column 'Comment', :context

    column 'User Rating', :average_rating
    column 'Image Id', :image_id do |comment|
      comment.commentable.images.map(&:id).join(", ")
      # if comment.commentable.images
      #   comment.commentable.images.each do |image|
      #     link_to image.id, admin_dish_image_path(image.id)
      #   end
      # end
    end
    # column :commentable_type
    column :created_at
    column :updated_at
    # column :context
    actions
  end

end
