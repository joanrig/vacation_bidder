class CreateBucketListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bucket_list_items do |t|
      t.string :title
      t.integer :traveler_id
      t.integer :attraction_ids
      t.integer :vacation_id
      t.text :notes
      t.timestamps
    end
  end
end
