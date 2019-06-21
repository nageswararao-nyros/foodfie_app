class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string     :title
      t.text       :description
      t.attachment :image

      t.timestamps null: false
    end
  end
end
