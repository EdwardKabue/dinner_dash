class Item < ActiveRecord::Base
	has_many :categorisations
	has_many :categories, :through => :categorisations
	has_many :line_items
	has_many :carts, :through => :line_items
end
