class AddLocalImageToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :local_image_file_name, :string
    add_column :images, :local_image_content_type, :string
    add_column :images, :local_image_file_size, :integer
    add_column :images, :local_image_updated_at, :datetime
  end
end
