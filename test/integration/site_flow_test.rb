require 'test_helper'

class SiteFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def login_as(user, password)
  	post sessions_path, session: {email: user.email, password: password}
  end

  test "user sign in and browse items on offer" do
  	get "/login"
  	assert_response :success
  	login_as(users(:andy), "mystring1")
  	assert_redirected_to root_url
  	get "/items"
  	assert_response :success
  	assert assigns(:items)
  end

  test "user sign in and place order" do
    login_as(users(:andy), "mystring1")
    assert_redirected_to root_url
    get "/items"
    get "/items/?id=#{items(:one).id}"
    assert_response :success
    post line_items_path, item_id: items(:one).id
    assert assigns(:line_item).save
    post orders_path, order: { user_id: users(:andy).id, line_item_ids: [assigns(:line_item).id], ordered: true, pickup_or_delivery: true, address_attributes: { city: "New York", state: "New York", zip: "123", street_number: 12 } }
    assert assigns(:order)
  end
end
