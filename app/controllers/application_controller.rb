class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CurrentCart
  helper_method :current_user, :logged_in?, :is_user_admin?, :cart_items

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

	  def is_user_admin?
	  	if logged_in?
	  		current_user.admin
	  	else
	  		return false
	  	end	
	  end	

	  #def cart_items
	  #	cart = Cart.find(session[:cart_id])
	  #	!cart.line_items.empty?
	  #end	

	  def redirect_if_not_admin
	  	if !is_user_admin?
	  		redirect_to root_url
	  	end
	  end
end
