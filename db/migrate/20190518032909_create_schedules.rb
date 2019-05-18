class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :departure_city
      t.date :departure_date
      t.string :return_city
      t.date :return_date
      t.string :vacation_id

      t.timestamps
    end
  end
end
