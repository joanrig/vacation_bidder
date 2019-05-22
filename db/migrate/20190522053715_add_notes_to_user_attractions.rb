class AddNotesToUserAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :user_attractions, :notes, :string
  end
end
