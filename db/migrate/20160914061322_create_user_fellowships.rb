class CreateUserFellowships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_fellowships do |t|
      t.integer :follower_id, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :user_fellowships, [:follower_id, :user_id], unique: true
  end
end
