class CreateBucketVacations < ActiveRecord::Migration[5.2]
  def change
    create_table :bucket_vacations do |t|
      t.integer :bucket_list_item_id
      t.integer :vacation_id

      t.timestamps
    end
  end
end
