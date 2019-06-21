class AddUserRatingToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :average_rating, :float
    add_column :comments, :report, :string
  end
end
