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
 
end
