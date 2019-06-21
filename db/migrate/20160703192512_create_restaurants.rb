class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.integer :follower_id, index: true
      t.integer :favourited_by, index: true

      t.timestamps null: false
    end
  end
end
