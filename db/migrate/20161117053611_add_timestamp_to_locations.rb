class AddTimestampToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :timestamp, :timestamp
  end
end
