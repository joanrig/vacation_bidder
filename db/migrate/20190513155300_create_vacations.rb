class CreateVacations < ActiveRecord::Migration[5.2]
  def change
    create_table :vacations do |t|
      t.string :name
      t.string :category
      t.integer :budget
      t.integer :number_of_travelers
      t.integer :requirements_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
