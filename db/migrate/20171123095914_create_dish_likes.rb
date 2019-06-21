class CreateDishLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_likes do |t|
      t.integer    :user_id
      t.integer    :dish_id
      t.timestamps null: false
    end
  end
end
