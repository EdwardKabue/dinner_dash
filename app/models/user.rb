class User < ActiveRecord::Base
	has_many :orders
	has_secure_password
	validates :email, presence: true,
					  uniqueness: {case_sensitive: false},
					  format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Kindly enter a valid email address e.g 'you@example.com'."}
	
	validates :full_name, presence: true,
						  format: { with: /\A[A-Z]{1}[a-z]+(?:\s[A-Z]{1}[a-z]+){1}\z/, message: 'Use the format "Firstname Lastname".'},
						  uniqueness: true,
						  :on => :create
	validates :display_name, length: {in: 2..32}		 
	
end
