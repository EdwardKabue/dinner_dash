# == Schema Information
#
# Table name: categorisations
#
#  id          :integer          not null, primary key
#  category_id :integer
#  item_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Categorisation < ActiveRecord::Base
	belongs_to :category
	belongs_to :item
end
