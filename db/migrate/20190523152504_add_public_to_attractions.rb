class AddPublicToAttractions < ActiveRecord::Migration[5.2]
    def change
      add_column :attractions, :public, :boolean, default: false
    end
end
