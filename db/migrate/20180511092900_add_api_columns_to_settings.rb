class AddApiColumnsToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :google_places_api, :string
    add_column :settings, :google_maps_api, :string
  end
end
