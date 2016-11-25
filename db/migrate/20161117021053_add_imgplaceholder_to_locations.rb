class AddImgplaceholderToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :imgplaceholder, :string
  end
end
