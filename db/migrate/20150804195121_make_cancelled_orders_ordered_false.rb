class MakeCancelledOrdersOrderedFalse < ActiveRecord::Migration
  def change
  	Order.where(cancelled: true).each do |order|
  		order.update(ordered: false, completed: false)
  	end
  end
end
