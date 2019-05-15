class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :website
      t.integer :destination_id
      t.text_area :notes
      t.timestamps
    end
  end
end
