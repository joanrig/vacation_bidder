class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :website
      t.string :city
      t.string :state
      t.string :country
      t.string :notes
      t.timestamps
    end
  end
end
