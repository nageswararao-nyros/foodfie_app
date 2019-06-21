class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.references :restaurant, index: true
      t.string :name
      t.decimal :price, precision: 12, scale: 2
      t.text :description

      t.timestamps null: false
    end
  end
end
