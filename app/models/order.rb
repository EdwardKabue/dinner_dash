class Order < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_one :address
	accepts_nested_attributes_for :address
	validates_presence_of :user
end
