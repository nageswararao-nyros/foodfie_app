class ChangeGooglePlaceFormatInRestaurant < ActiveRecord::Migration[5.2]
  	def up
    	change_column :restaurants, :google_place_id, :string
  	end

    def down
      change_column :restaurants, :google_place_id, :integer
    end
end
