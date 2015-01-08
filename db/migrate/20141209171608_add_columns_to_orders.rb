class AddColumnsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :ordered, :boolean
  	add_column :orders, :cancelled, :boolean
  	add_column :orders, :completed, :boolean
  	add_column :orders, :paid, :boolean
  end
end
