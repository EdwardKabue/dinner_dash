class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :cart
    belongs_to :item

    def title
    	item.title
    end	
end
