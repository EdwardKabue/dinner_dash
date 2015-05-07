require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user must have a plausibly valid email address" do 
  	user = User.new
  	user.full_name = "John Kimani"
  	user.email = "myemail"
    user.password = "kimani"
  	user.password_confirmation = "kimani"

    assert_not user.save
    assert_not user.errors[:email].empty?
  end

  test "user must have a full name that is not blank" do
    user = User.new
    user.full_name = ""
    user.email = "maina@gmail.com"
    user.password = "maina"
    user.password_confirmation = "maina"

    assert_not user.save
    assert_not user.errors[:full_name].empty?
  end

  test "user may optionally provide a display name that's longer than 2 and less than 32 characters" do
    user = User.new
    user.full_name = "David Beckham"
    user.display_name = ""
    user.email = "david@gmail.com"
    user.password = "becks"
    user.password_confirmation = "becks"

    assert user.save
    assert user.errors[:display_name].empty?
  end


end
