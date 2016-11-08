class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :latitude
      t.integer :longitude
      t.string :user_id

      t.timestamps
    end
  end
end
