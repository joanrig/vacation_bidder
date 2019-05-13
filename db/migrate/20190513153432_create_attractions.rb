class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :category
      t.string :website
      t.integer :destination_id
      t.timestamps
    end
  end
end
