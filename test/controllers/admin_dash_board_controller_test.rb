require 'test_helper'

class AdminDashBoardControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  	@order = orders(:one)
  end

  test "should get index" do
  	login(:edward)
  	get :index
  	assert_response :success
  end	

  test "should show order" do
  	login(:edward)
  	get :show, id: @order
  	assert_response :success
  end

  test "should mark order as completed" do
  	login(:edward)
  	post :mark_as_completed, order_id: @order.id
  	assert_redirected_to admin_dash_board_path(assigns(:order))
    assert assigns(:order).completed
  end

  test "should cancel order" do
  	login(:edward)
  	post :cancel, order_id: @order.id
  	assert_redirected_to admin_dash_board_path(assigns(:order))
    assert assigns(:order).cancelled
  end

  test "should mark order as paid" do
  	login(:edward)
  	post :mark_as_paid, order_id: @order.id
  	assert_redirected_to admin_dash_board_path(assigns(:order))
    assert assigns(:order).paid
  end

end
