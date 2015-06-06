require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "should clear cart" do
  	session[:cart_id] = carts(:one).id
  	assert_difference('Cart.count', -1) do
    	delete :destroy, id: carts(:one) 
    end
  end
end
