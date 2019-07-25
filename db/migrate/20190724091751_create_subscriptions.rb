class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.text :endpoint
      t.text :p256dh

      t.timestamps
    end
  end
end
