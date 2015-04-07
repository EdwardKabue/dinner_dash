require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "an order must belong to a user" do
  	order = Order.new
  	order.line_items << line_items(:one)
  	order.pickup_or_delivery = "true"
  	order.address = addresses(:one)

  	assert_not order.save
  	assert_not order.errors[:user_id].empty?
  end

  test "an order must be for one or more items being currently sold" do
  	order = Order.new
  	order.pickup_or_delivery = "true"
  	order.address = addresses(:two)
  	order.user_id = users(:two).id

  	assert_not order.save
  	assert_not order.errors[:line_items].empty?
  end
end
