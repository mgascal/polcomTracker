require 'test_helper'

class DocumentTypesControllerTest < ActionController::TestCase
  setup do
    @document_type = document_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_type" do
    assert_difference('DocumentType.count') do
      post :create, document_type: { CREATE_BY: @document_type.CREATE_BY, CREATE_DATE: @document_type.CREATE_DATE, DOCUMENT_TYPE: @document_type.DOCUMENT_TYPE, UPDATED_BY: @document_type.UPDATED_BY, UPDATED_DATE: @document_type.UPDATED_DATE }
    end

    assert_redirected_to document_type_path(assigns(:document_type))
  end

  test "should show document_type" do
    get :show, id: @document_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_type
    assert_response :success
  end

  test "should update document_type" do
    put :update, id: @document_type, document_type: { CREATE_BY: @document_type.CREATE_BY, CREATE_DATE: @document_type.CREATE_DATE, DOCUMENT_TYPE: @document_type.DOCUMENT_TYPE, UPDATED_BY: @document_type.UPDATED_BY, UPDATED_DATE: @document_type.UPDATED_DATE }
    assert_redirected_to document_type_path(assigns(:document_type))
  end

  test "should destroy document_type" do
    assert_difference('DocumentType.count', -1) do
      delete :destroy, id: @document_type
    end

    assert_redirected_to document_types_path
  end
end
