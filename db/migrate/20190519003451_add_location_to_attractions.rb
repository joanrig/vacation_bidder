class AddLocationToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :county, :string
  end
end
