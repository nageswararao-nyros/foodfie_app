class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.attachment :image
      t.integer     :attachable_id
      t.string     :attachable_type

      t.timestamps null: false
    end
  end
end
