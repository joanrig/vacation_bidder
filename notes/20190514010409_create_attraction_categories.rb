class CreateAttractionCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :attraction_categories do |t|
      t.integer :attraction_id
      t.integer :category_id
    end
  end
end
