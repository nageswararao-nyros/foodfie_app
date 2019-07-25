class AddAuthColumnToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :auth, :string
  end
end
