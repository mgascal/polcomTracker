require 'test_helper'

class LockedFormsControllerTest < ActionController::TestCase
  setup do
    @locked_form = locked_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locked_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locked_form" do
    assert_difference('LockedForm.count') do
      post :create, locked_form: { FORM_ID: @locked_form.FORM_ID, SESSION_ID: @locked_form.SESSION_ID, USER_ID: @locked_form.USER_ID }
    end

    assert_redirected_to locked_form_path(assigns(:locked_form))
  end

  test "should show locked_form" do
    get :show, id: @locked_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @locked_form
    assert_response :success
  end

  test "should update locked_form" do
    put :update, id: @locked_form, locked_form: { FORM_ID: @locked_form.FORM_ID, SESSION_ID: @locked_form.SESSION_ID, USER_ID: @locked_form.USER_ID }
    assert_redirected_to locked_form_path(assigns(:locked_form))
  end

  test "should destroy locked_form" do
    assert_difference('LockedForm.count', -1) do
      delete :destroy, id: @locked_form
    end

    assert_redirected_to locked_forms_path
  end
end
