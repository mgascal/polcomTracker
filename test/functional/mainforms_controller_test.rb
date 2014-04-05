require 'test_helper'

class MainformsControllerTest < ActionController::TestCase
  setup do
    @mainform = mainforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mainforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mainform" do
    assert_difference('Mainform.count') do
      post :create, mainform: {  }
    end

    assert_redirected_to mainform_path(assigns(:mainform))
  end

  test "should show mainform" do
    get :show, id: @mainform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mainform
    assert_response :success
  end

  test "should update mainform" do
    put :update, id: @mainform, mainform: {  }
    assert_redirected_to mainform_path(assigns(:mainform))
  end

  test "should destroy mainform" do
    assert_difference('Mainform.count', -1) do
      delete :destroy, id: @mainform
    end

    assert_redirected_to mainforms_path
  end
end
