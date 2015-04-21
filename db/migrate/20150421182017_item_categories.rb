class ItemCategories < ActiveRecord::Migration
  def change
  	create_table :item_categories, id: false do |t| 
  		t.integer :item_id
  		t.integer :category_id
  	end

  	add_index :item_categories, [:item_id, :category_id]
  end
end
