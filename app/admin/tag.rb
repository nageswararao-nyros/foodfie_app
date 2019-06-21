ActiveAdmin.register Tag do
  menu :label => "Tags", :priority => 9
  before_action :skip_sidebar!, :only => :index
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :count
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
    column 'Tag Id', :id
    column 'Tag Name', :name
    column 'Count', :count
    actions
  end
  

end
