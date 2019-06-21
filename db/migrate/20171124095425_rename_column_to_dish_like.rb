class RenameColumnToDishLike < ActiveRecord::Migration[5.2]
  def change
  	rename_column :dish_likes, :dish_id, :image_id
  end
end
