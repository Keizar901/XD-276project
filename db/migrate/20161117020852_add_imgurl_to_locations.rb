class AddImgurlToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :imgurl, :string
  end
end
