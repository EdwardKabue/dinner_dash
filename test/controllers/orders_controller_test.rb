require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    login(:andy)
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    login(:andy)
    get :new
    assert_response :success
  end

  test "should create order" do
    login(:andy)
    
    assert_difference('Order.count') do
      post :create, order: { user_id: users(:andy).id, ordered: true, line_item_ids: carts(:one).line_item_ids, pickup_or_delivery: true, address_attributes: { city: "New York", state: "New York", zip: "123", street_number: 12 } }
    end


    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    login(:edward)
    set_cart(@cart)
    patch :update, id: @order, order: { ordered: "true", user_id: session[:user_id], line_item_ids: @cart.line_item_ids, pickup_or_delivery: "false" }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end