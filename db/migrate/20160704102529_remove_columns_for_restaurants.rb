class RemoveColumnsForRestaurants < ActiveRecord::Migration[5.2]
  def up
    remove_index :restaurants, :follower_id
    remove_column :restaurants, :follower_id
    remove_index :restaurants, :favourited_by
    remove_column :restaurants, :favourited_by
  end
  def down
    add_column :restaurants, :favourited_by, :integer
    add_index :restaurants, :favourited_by
    add_column :restaurants, :follower_id, :integer
    add_index :restaurants, :follower_id
  end
end
