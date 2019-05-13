class CreateBucketAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :bucket_attractions do |t|
      t.integer :bucket_list_item_id
      t.integer :attraction_id
    end
  end
end
