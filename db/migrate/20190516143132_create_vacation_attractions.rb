class CreateVacationAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :vacation_attractions do |t|
      t.integer :vacation_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
