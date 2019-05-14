class CreateTravelers < ActiveRecord::Migration[5.2]
  def change
    create_table :travelers do |t|
      t.boolean :organizer, default: false
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.timestamps
    end
  end
end
