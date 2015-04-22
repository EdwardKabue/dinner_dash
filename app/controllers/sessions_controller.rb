class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		login user
  		flash[:success] = "You are now logged in."
  		redirect_to root_url
  	else
  		flash.now[:error] = "Your email/password combination was incorrect."
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: 'You are now logged out!'
  end
 
end
