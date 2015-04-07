require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
  	@user = users(:edward)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should log user in" do
  	post :create, session: {email: @user.email, password: "mystring"}
  	assert_response :redirect
  	assert_redirected_to root_path
  end

  test "should log user out" do
  	delete :destroy
  	assert_response :redirect
  	assert_redirected_to root_path
  end

end
