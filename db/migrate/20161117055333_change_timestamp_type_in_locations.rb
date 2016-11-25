class ChangeTimestampTypeInLocations < ActiveRecord::Migration[5.0]
  def change
  	change_column :locations, :timestamp, :timestamptz
  end
end
