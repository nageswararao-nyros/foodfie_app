class AddReportToDish < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :user_rating, :float
    add_column :dishes, :image_id, :integer
  end
end
