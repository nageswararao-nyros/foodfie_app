class CreateRestaurantFellowships < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_fellowships do |t|
      t.integer :follower_id, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :restaurant_fellowships, [:follower_id, :restaurant_id], unique: true
  end
end
