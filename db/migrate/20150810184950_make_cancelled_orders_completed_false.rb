class MakeCancelledOrdersCompletedFalse < ActiveRecord::Migration
  def change
  	Order.where(cancelled: true).each do |order|
  		order.update(ordered: true, completed: false, paid: false)
  	end
  end
end
