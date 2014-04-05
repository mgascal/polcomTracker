require 'test_helper'

class SubmissionTypesControllerTest < ActionController::TestCase
  setup do
    @submission_type = submission_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submission_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submission_type" do
    assert_difference('SubmissionType.count') do
      post :create, submission_type: { CREATE_BY: @submission_type.CREATE_BY, CREATE_DATE: @submission_type.CREATE_DATE, SUBMISSION_TYPE: @submission_type.SUBMISSION_TYPE, UPDATED_BY: @submission_type.UPDATED_BY, UPDATED_DATE: @submission_type.UPDATED_DATE }
    end

    assert_redirected_to submission_type_path(assigns(:submission_type))
  end

  test "should show submission_type" do
    get :show, id: @submission_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submission_type
    assert_response :success
  end

  test "should update submission_type" do
    put :update, id: @submission_type, submission_type: { CREATE_BY: @submission_type.CREATE_BY, CREATE_DATE: @submission_type.CREATE_DATE, SUBMISSION_TYPE: @submission_type.SUBMISSION_TYPE, UPDATED_BY: @submission_type.UPDATED_BY, UPDATED_DATE: @submission_type.UPDATED_DATE }
    assert_redirected_to submission_type_path(assigns(:submission_type))
  end

  test "should destroy submission_type" do
    assert_difference('SubmissionType.count', -1) do
      delete :destroy, id: @submission_type
    end

    assert_redirected_to submission_types_path
  end
end
