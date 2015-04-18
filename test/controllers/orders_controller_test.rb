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
    set_cart(:one)
    assert_difference('Order.count') do
      post :create, order: { user_id: users(:andy).id, ordered: true, pickup_or_delivery: true, address_attributes: { city: "New York", state: "New York", zip: "123", street_number: 12 } }
    end


    assert_redirected_to order_path(assigns(:order))
    assert_equal true, assigns(:order).ordered
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    login(:edward)
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    login(:edward)
    set_cart(:one)
    patch :update, id: @order, order: { ordered: "true", user_id: session[:user_id], pickup_or_delivery: "false", address_attributes: addresses(:two).attributes, line_items_attributes: [{id: line_items(:one).id, _destroy: 1}] }
    assert_redirected_to order_path(assigns(:order))
    assert_equal false, assigns(:order).pickup_or_delivery
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
