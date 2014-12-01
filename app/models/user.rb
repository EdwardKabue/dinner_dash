class User < ActiveRecord::Base
	has_many :orders
	has_secure_password
	validates :email, presence: true,
					  uniqueness: {case_sensitive: false},
					  format: {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, message: "Kindly enter a valid email address e.g 'you@example.com'"}
	validates :password, presence: true,
						 length: {in: 4..8}
	validates :full_name, presence: true,
						  format:{ with: /^[A-Z]{1}[a-z]+(?:\s[A-Z]{1}[a-z]+){1}$/, message: 'Use the format "FirstName LastName" with a space in between'},
						  uniqueness: true,
						  :on => :create
	validates :display_name, length: {in: 2..32}		 
	validates :password_confirmation, presence: true,
									  length: {in: 4..8},
									  uniqueness: true,
									  :on => :create
end
