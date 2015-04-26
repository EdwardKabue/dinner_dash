require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "new_password" do
    mail = UserMailer.new_password(users(:edward), "lambasted")
    assert_equal "Your new password", mail.subject
    assert_equal ["#{users(:edward).email}"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Your new password is: lambasted", mail.body.encoded
  end

end
