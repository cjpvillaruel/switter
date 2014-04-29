require 'test_helper'

class SoursControllerTest < ActionController::TestCase
  setup do
    @sour = sours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sour" do
    assert_difference('Sour.count') do
      post :create, sour: { string: @sour.string, swit_id: @sour.swit_id, user_id: @sour.user_id }
    end

    assert_redirected_to sour_path(assigns(:sour))
  end

  test "should show sour" do
    get :show, id: @sour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sour
    assert_response :success
  end

  test "should update sour" do
    patch :update, id: @sour, sour: { string: @sour.string, swit_id: @sour.swit_id, user_id: @sour.user_id }
    assert_redirected_to sour_path(assigns(:sour))
  end

  test "should destroy sour" do
    assert_difference('Sour.count', -1) do
      delete :destroy, id: @sour
    end

    assert_redirected_to sours_path
  end
end
