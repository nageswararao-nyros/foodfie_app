class CreateDishesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes_users do |t|
      t.references :user, index: true
      t.references :dish, index: true
      t.timestamps null: false
    end
    execute "INSERT INTO dishes_users (dish_id, user_id, created_at, updated_at) (select id as dish_id, user_id, now(), now() from dishes where user_id IS NOT NULL)"
    remove_column :dishes, :user_id
  end
end
