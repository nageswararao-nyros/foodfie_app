class AddNotificationColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fav_restaurant, :boolean, :default => true
    add_column :users, :fav_dish, :boolean, :default => true
    add_column :users, :post_by_follow_user, :boolean, :default => true
    add_column :users, :starts_following, :boolean, :default => true
  end
end
