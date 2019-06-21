class AddImageProcessingToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image_processing, :boolean, default: false
  end
end
