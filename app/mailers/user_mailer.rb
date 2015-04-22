class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_password.subject
  #
  def new_password(user, new_user_password)
    @reset_password = new_user_password
    @user = user

    mail to: @user.email, subject: "Your new password"
  end
end
