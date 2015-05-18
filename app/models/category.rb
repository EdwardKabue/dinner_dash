# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
	has_and_belongs_to_many :items, join_table: :item_categories
	validates :title, presence: true,
	 length: {minimum: 2, wrong_length: "Two is the minimum number of characters allowed." },
	 format: {with: /\A[A-Za-z\s]+\z/, message: "All titles can only have letters and spaces."},
	 uniqueness: true
end
