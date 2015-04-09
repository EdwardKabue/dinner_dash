require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :redirect
    assert_redirected_to controller: 'home', action: 'index'
  end

  test "should create item" do
    login(:edward)
    assert_difference('Item.count') do
      post :create, item: {title: "Pilau", price: @item.price, description: @item.description, category_ids: @item.category_ids}
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    login(:edward)
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    login(:edward)
    patch :update, id: @item, item: {title: "Pizza", price: @item.price, description: @item.description, category_ids: @item.category_ids}
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    login(:edward)
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end

  test "should retire item" do
    login(:edward)
    get :retire, id: @item
    assert_redirected_to item_path(assigns(:item))
  end
end
