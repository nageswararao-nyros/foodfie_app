class AddRepostedToDishesUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes_users, :reposted, :boolean, default: false
  end
end
