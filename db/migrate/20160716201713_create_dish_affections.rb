class CreateDishAffections < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_affections do |t|
      t.integer :favouriter_id, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :dish_affections, [:favouriter_id, :dish_id], unique: true
  end
end
