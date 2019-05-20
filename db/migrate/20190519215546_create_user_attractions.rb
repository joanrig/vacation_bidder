class CreateUserAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_attractions do |t|
      t.integer :user_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
