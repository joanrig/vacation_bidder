class CreateTravelers < ActiveRecord::Migration[5.2]
  def change
    create_table :travelers do |t|
      t.boolean :organizer
      t.string :name
      t.string :email
      t.integer :age
      t.timestamps
    end
  end
end
