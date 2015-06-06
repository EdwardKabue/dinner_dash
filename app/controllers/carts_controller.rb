class CartsController < ApplicationController
	before_action :set_cart, only: [:destroy]

  def destroy
  	@cart.destroy if @cart.id == session[:cart_id]
  	session[:cart_id] = nil
  	flash[:notice] = "Your cart is currently empty"
  	redirect_to root_url
  end

  def set_cart
  	@cart = Cart.find(params[:id])
  end
end
