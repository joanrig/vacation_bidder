class CreateBucketListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bucket_list_items do |t|
      t.string :title
      t.integer :user_id
      t.text :notes
      t.integer :vacation_id
      t.timestamps
    end
  end
end
