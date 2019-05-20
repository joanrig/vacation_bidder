class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image
      t.string :panel_a_rgb
      t.timestamps
    end
  end
end
