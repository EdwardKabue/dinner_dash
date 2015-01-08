class RemoveOrderIdFromCart < ActiveRecord::Migration
  def change
  	add_column :line_items, :order_id, :integer
  	remove_column :carts, :order_id, :integer
  end
end
