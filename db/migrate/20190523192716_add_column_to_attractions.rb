class AddColumnToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :created_by, :integer
  end
end
