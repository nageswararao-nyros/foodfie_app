class ChangeWeightColumnInRatings < ActiveRecord::Migration[5.2]
  def change
    change_column :ratings, :weight, :float
    Rating.update_all("weight=(((weight/10)*2).ceil)/2")
  end
end
