require 'test_helper'

class ProprietariesControllerTest < ActionController::TestCase
  setup do
    @proprietary = proprietaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proprietaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proprietary" do
    assert_difference('Proprietary.count') do
      post :create, proprietary: { KSQ_SEQ_NO: @proprietary.KSQ_SEQ_NO, MEMBERSHIP: @proprietary.MEMBERSHIP }
    end

    assert_redirected_to proprietary_path(assigns(:proprietary))
  end

  test "should show proprietary" do
    get :show, id: @proprietary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proprietary
    assert_response :success
  end

  test "should update proprietary" do
    put :update, id: @proprietary, proprietary: { KSQ_SEQ_NO: @proprietary.KSQ_SEQ_NO, MEMBERSHIP: @proprietary.MEMBERSHIP }
    assert_redirected_to proprietary_path(assigns(:proprietary))
  end

  test "should destroy proprietary" do
    assert_difference('Proprietary.count', -1) do
      delete :destroy, id: @proprietary
    end

    assert_redirected_to proprietaries_path
  end
end
