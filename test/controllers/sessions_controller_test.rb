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

  test "should reset password" do
    assert_difference 'ActionMailer::Base.deliveries.size' do
      post :forgot_password, session: {email: @user.email}
    end

    reset_email = ActionMailer::Base.deliveries.last
    assert_equal "Your new password", reset_email.subject
    assert_equal "#{@user.email}", reset_email.to[0]
    assert_match /Your new password is/, reset_email.body.to_s
  end
end
