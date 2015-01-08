class Cart < ActiveRecord::Base
	belongs_to :order
	has_many :line_items
	has_many :items :through => :line_items

	def add_item(item_id)
		new_item = line_items.find_by(item_id: item_id)
		if new_item
			new_item.quantity += 1
		else
			new_item = line_items.build(item_id: item_id)	
		end	
		new_item
	end
end
