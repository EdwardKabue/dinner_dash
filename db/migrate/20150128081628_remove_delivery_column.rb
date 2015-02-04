class RemoveDeliveryColumn < ActiveRecord::Migration
  def change
  	remove_column :orders, :delivery, :boolean
  	rename_column :orders, :pickup, :pickup_or_delivery
  end
end
