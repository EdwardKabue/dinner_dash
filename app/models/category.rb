class Category < ActiveRecord::Base
	has_many :categorisations
	has_many :items, :through => :categorisations
	validates :title, presence: true,
	 length: {minimum: 2, wrong_length: "Two is the minimum number of characters allowed." },
	 format: {with: /\A[A-Z][a-z]+\z/, message: "All titles have to begin with capital letters."},
	 uniqueness: true
end
