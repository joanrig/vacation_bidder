class CreateBidders < ActiveRecord::Migration[5.2]
  def change
    create_table :bidders do |t|
      t.string :name
      t.string :email
      t.string :website
      t.integer :user_id

      t.timestamps
    end
  end
end
