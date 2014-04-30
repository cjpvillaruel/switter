require 'test_helper'

class DoortagsControllerTest < ActionController::TestCase
  setup do
    @doortag = doortags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doortags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doortag" do
    assert_difference('Doortag.count') do
      post :create, doortag: { string: @doortag.string, swit_id: @doortag.swit_id, tag: @doortag.tag }
    end

    assert_redirected_to doortag_path(assigns(:doortag))
  end

  test "should show doortag" do
    get :show, id: @doortag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doortag
    assert_response :success
  end

  test "should update doortag" do
    patch :update, id: @doortag, doortag: { string: @doortag.string, swit_id: @doortag.swit_id, tag: @doortag.tag }
    assert_redirected_to doortag_path(assigns(:doortag))
  end

  test "should destroy doortag" do
    assert_difference('Doortag.count', -1) do
      delete :destroy, id: @doortag
    end

    assert_redirected_to doortags_path
  end
end
