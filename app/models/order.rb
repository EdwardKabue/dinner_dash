# == Schema Information
#
# Table name: orders
#
#  id                 :integer          not null, primary key
#  pickup_or_delivery :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  ordered            :boolean
#  cancelled          :boolean
#  completed          :boolean
#  paid               :boolean
#  completed_at       :datetime
#  cancelled_at       :datetime
#

class Order < ActiveRecord::Base
	belongs_to :user
	has_many :line_items, as: :line_itemable
	has_one :address, dependent: :destroy
	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :line_items, allow_destroy: true

	validates_presence_of :user_id, :line_items
	
	def total_price
		total_order_price = 0
		order_items = self.line_items
	    order_items.each do |order_item|
	      total_order_price += order_item.quantity * order_item.item.price
	    end
	    return total_order_price
	end	

	#private 

	#	def ensure_line_items_are_present
	#		if attribute_present?("line_item_ids")
	#			return true
	#		else	
	#			errors.add(:base, "There aren't any line items for this order.")
	#			return false
	#		end
	#	end		
end
