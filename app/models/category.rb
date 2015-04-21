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
	 format: {with: /\A[A-Z][a-z]+\z/, message: "All titles have to begin with capital letters."},
	 uniqueness: true
end
