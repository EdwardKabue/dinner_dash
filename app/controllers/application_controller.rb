class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  protected

	  def login(user)	
	  	session[:user_id] = user.id 
	  end

	  def current_user
	  	current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end	

	  def logged_in?
	  	!current_user.nil?
	  end	

	  def is_user_signed_in?
	  	if !logged_in?
	  		redirect_to :controller => 'session', :action => 'new'
	  	end
	  end		

end
