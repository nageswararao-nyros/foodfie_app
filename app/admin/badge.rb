ActiveAdmin.register Badge do
  menu :label => "Badges", :priority => 3
	permit_params :image, :title, :description
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

	index do
    selectable_column
    id_column
    column :title
    column :description
    column 'Image' do |image|
      image_tag(image.image.url(:thumb))
    end
    actions
  end

  show do
  	attributes_table do
	    row :title
	    row :description
	    row 'Image' do |image|
	      image_tag(image.image.url(:thumb))
	    end
	  end
  end

	form do |f|
		f.inputs :title, :description
    f.inputs "Upload" do
      f.input :image, required: true, as: :file
    end
    f.actions
  end

end
