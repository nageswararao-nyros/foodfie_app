class AddCountToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :count, :integer
  end
end
