class RemoveItemCountFromCart < ActiveRecord::Migration
  def change
    remove_column :carts, :item_count, :integer
  end
end
