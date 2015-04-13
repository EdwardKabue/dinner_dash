# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  street_number :integer
#  city          :string(255)
#  state         :string(255)
#  zip           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  order_id      :integer
#

class Address < ActiveRecord::Base
	belongs_to :order
end
