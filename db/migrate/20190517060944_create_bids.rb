class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.string :amount
      t.string :link
      t.integer :vacation_id
      t.integer :bidder_id

      t.timestamps
    end
  end
end
