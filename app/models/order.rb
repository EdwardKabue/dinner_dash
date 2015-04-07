class Order < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_one :address
	accepts_nested_attributes_for :address
	validates_presence_of :user_id, :line_item_ids
	
	def total_price
		total_order_price = 0
		order_items = self.line_items
	    order_items.each do |order_item|
	      total_order_price += order_item.quantity * order_item.item.price
	    end
	    return total_order_price
	end	
end
