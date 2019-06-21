class ChangeLatLonToFloatFormatInRestaurants < ActiveRecord::Migration[5.2]
  def up
  	change_column :restaurants, :longitude, :float
    change_column :restaurants, :latitude, :float
    
  end
  def down
    change_column :restaurants, :longitude,:decimal, {:precision=>18, :scale=>13}
    change_column :restaurants, :latitude,:decimal, {:precision=>18, :scale=>13}
  end
end
