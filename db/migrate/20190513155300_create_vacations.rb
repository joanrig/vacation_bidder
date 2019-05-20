class CreateVacations < ActiveRecord::Migration[5.2]
  def change
    create_table :vacations do |t|
      t.string :name
      t.string :category
      t.integer :budget
      t.integer :number_of_travelers
      t.string :notes
      t.boolean :open_to_bids, :default => "false"
      t.integer :bucket_list_item_id

      t.timestamps
    end
  end
end
