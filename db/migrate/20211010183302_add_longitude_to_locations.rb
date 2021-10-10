class AddLongitudeToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :longitude, :float
  end
end
