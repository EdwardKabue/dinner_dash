require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:andy)
  end
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new user" do
  	post :create, user: { full_name: "Edward Andrew", display_name: "Edu", email: "edward@yahoo.com", password: "eduardo", password_confirmation: "eduardo" }
  	#assert_response :redirect
  	assert_redirected_to root_url
  	#assert_nil assigns(:user)
  end

  test "should update user" do
    patch :update, id: @user, user: { email: "andedward7@gmail.com", display_name: "Andre"}
    assert_redirected_to root_url
  end
end
