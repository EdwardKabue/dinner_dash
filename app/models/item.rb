class Item < ActiveRecord::Base
	has_many :categorisations
	has_many :categories, :through => :categorisations
	has_many :line_items
	has_many :carts, :through => :line_items
	has_attached_file :photo, styles: {medium: "300x300>"}
	validates_attachment :photo, content_type: {content_type: ["image/jpeg", "image/jpg", "image/png"]}
	validates_presence_of :title, :price, :description, :category_ids
	validates_uniqueness_of :title
	validates_numericality_of :price, greater_than: 0
	validates :title, format: {with: /\A[a-zA-Z]+\z/}
	validates :description, format: {with: /\A[a-zA-Z]+\z/}
	before_destroy :ensure_item_not_referenced_by_line_item
	private

	def ensure_item_not_referenced_by_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Referenced in line items')
			return false
		end
	end	
end
