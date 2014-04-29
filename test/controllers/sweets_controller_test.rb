require 'test_helper'

class SweetsControllerTest < ActionController::TestCase
  setup do
    @sweet = sweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sweet" do
    assert_difference('Sweet.count') do
      post :create, sweet: { swit_id: @sweet.swit_id, user_id: @sweet.user_id }
    end

    assert_redirected_to sweet_path(assigns(:sweet))
  end

  test "should show sweet" do
    get :show, id: @sweet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sweet
    assert_response :success
  end

  test "should update sweet" do
    patch :update, id: @sweet, sweet: { swit_id: @sweet.swit_id, user_id: @sweet.user_id }
    assert_redirected_to sweet_path(assigns(:sweet))
  end

  test "should destroy sweet" do
    assert_difference('Sweet.count', -1) do
      delete :destroy, id: @sweet
    end

    assert_redirected_to sweets_path
  end
end
