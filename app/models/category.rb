class Category < ActiveRecord::Base
	has_many :categorisations
	has_many :items, :through => :categorisations
end
