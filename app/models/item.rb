# == Schema Information
#
# Table name: items
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  price              :float
#  created_at         :datetime
#  updated_at         :datetime
#  retired            :boolean
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Item < ActiveRecord::Base
	has_and_belongs_to_many :categories, join_table: :item_categories
	has_many :line_items
	has_many :carts, :through => :line_items
	has_attached_file :photo, styles: {large: "600x600>", medium: "300x300>"}
	validates_attachment :photo, content_type: {content_type: ["image/jpeg", "image/jpg", "image/png"]}
	validates_presence_of :title, :price, :description, :category_ids
	validates_uniqueness_of :title
	validates_numericality_of :price, greater_than: 0
	validates :title, format: {with: /\A[a-zA-Z\s]+\z/, message: "Titles can only have letters and spaces."}
	validates :description, format: {with: /\A[A-Za-z\s\.,]+\z/, message: "The description can only have letters, spaces and full-stops."}
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
