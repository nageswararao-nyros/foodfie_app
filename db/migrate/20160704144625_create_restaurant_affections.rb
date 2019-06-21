class CreateRestaurantAffections < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_affections do |t|
      t.integer :favouriter_id, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :restaurant_affections, [:favouriter_id, :restaurant_id], unique: true
  end
end
