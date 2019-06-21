class CreateAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :authentications do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
