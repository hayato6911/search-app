class RemoveLongitudeFromLocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :longitude, :float
  end
end
