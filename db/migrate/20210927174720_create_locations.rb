class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :address
      t.string :price
      t.string :location_image
      t.string :user_id
      t.string :introduction
      t.float :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
