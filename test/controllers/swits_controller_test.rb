require 'test_helper'

class SwitsControllerTest < ActionController::TestCase
  setup do
    @swit = swits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swit" do
    assert_difference('Swit.count') do
      post :create, swit: { post: @swit.post }
    end

    assert_redirected_to swit_path(assigns(:swit))
  end

  test "should show swit" do
    get :show, id: @swit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swit
    assert_response :success
  end

  test "should update swit" do
    patch :update, id: @swit, swit: { post: @swit.post }
    assert_redirected_to swit_path(assigns(:swit))
  end

  test "should destroy swit" do
    assert_difference('Swit.count', -1) do
      delete :destroy, id: @swit
    end

    assert_redirected_to swits_path
  end
end
