class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :context
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
