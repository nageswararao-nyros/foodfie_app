class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :activation_token
      t.string :authentication_token
      t.boolean :activated, default: false
      t.string :reset_password_token
      
      t.datetime :activated_at
      t.datetime :reset_password_token_sent_at
      t.timestamps null: false
    end
  end
end
