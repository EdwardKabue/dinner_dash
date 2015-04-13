# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  item_id    :integer
#  quantity   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#  order_id   :integer
#

class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :cart
    belongs_to :item

    def title
    	item.title
    end	
end
