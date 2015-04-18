require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    login(:edward)
    get :new
    assert_response :success
  end

  test "should create category" do
    login(:edward)
    assert_difference('Category.count') do
      post :create, category: { title: "Fluids" }
    end

    assert_redirected_to category_path(assigns(:category))
    assert_equal "Fluids", assigns(:category).title
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    login(:edward)
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    login(:edward)
    patch :update, id: @category, category: { title: "Dessert" }
    assert_redirected_to category_path(assigns(:category))
    assert_equal "Dessert", assigns(:category).title
  end

  test "should destroy category" do
    login(:edward)
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
