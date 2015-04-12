require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new user" do
  	post :create, user: { full_name: "Edward Andrew", email: "edward@yahoo.com", password: "eduardo", password_confirmation: "eduardo" }
  	assert_response :redirect
  end

end
