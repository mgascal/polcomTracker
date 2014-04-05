require 'test_helper'

class FormsControllerTest < ActionController::TestCase
  setup do
    @form = forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form" do
    assert_difference('Form.count') do
      post :create, form: { CLIENT_REFERENCE_FILE: @form.CLIENT_REFERENCE_FILE, COMMENTS: @form.COMMENTS, CREATE_BY: @form.CREATE_BY, CREATE_DATE: @form.CREATE_DATE, DATE_RECEIVED: @form.DATE_RECEIVED, DUE_DATE: @form.DUE_DATE, EDITION_DATE: @form.EDITION_DATE, FORM_ID: @form.FORM_ID, FORM_LABEL: @form.FORM_LABEL, FORM_NO: @form.FORM_NO, LOADED: @form.LOADED, LOB: @form.LOB, MAPPED_BY: @form.MAPPED_BY, MAPPING_COMPLETED: @form.MAPPING_COMPLETED, NEW_FORM_ID: @form.NEW_FORM_ID, NEW_POLICY_NAME: @form.NEW_POLICY_NAME, NEW_TEXT_FILE_NAME: @form.NEW_TEXT_FILE_NAME, PARSING_COMPLETED: @form.PARSING_COMPLETED, POLICY_NAME: @form.POLICY_NAME, REVISED_ITEM_NO: @form.REVISED_ITEM_NO, SEQ_NO: @form.SEQ_NO, STATUS: @form.STATUS, SUBMITTERS_EMAIL: @form.SUBMITTERS_EMAIL, SUBMITTER_COMPANY: @form.SUBMITTER_COMPANY, SUBMITTER_NAME: @form.SUBMITTER_NAME, TEXT_FILE_NAME: @form.TEXT_FILE_NAME, TYPE_OF_DOCUMENT: @form.TYPE_OF_DOCUMENT, TYPE_OF_POLICY: @form.TYPE_OF_POLICY, UPDATED_BY: @form.UPDATED_BY, UPDATED_DATE: @form.UPDATED_DATE }
    end

    assert_redirected_to form_path(assigns(:form))
  end

  test "should show form" do
    get :show, id: @form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form
    assert_response :success
  end

  test "should update form" do
    put :update, id: @form, form: { CLIENT_REFERENCE_FILE: @form.CLIENT_REFERENCE_FILE, COMMENTS: @form.COMMENTS, CREATE_BY: @form.CREATE_BY, CREATE_DATE: @form.CREATE_DATE, DATE_RECEIVED: @form.DATE_RECEIVED, DUE_DATE: @form.DUE_DATE, EDITION_DATE: @form.EDITION_DATE, FORM_ID: @form.FORM_ID, FORM_LABEL: @form.FORM_LABEL, FORM_NO: @form.FORM_NO, LOADED: @form.LOADED, LOB: @form.LOB, MAPPED_BY: @form.MAPPED_BY, MAPPING_COMPLETED: @form.MAPPING_COMPLETED, NEW_FORM_ID: @form.NEW_FORM_ID, NEW_POLICY_NAME: @form.NEW_POLICY_NAME, NEW_TEXT_FILE_NAME: @form.NEW_TEXT_FILE_NAME, PARSING_COMPLETED: @form.PARSING_COMPLETED, POLICY_NAME: @form.POLICY_NAME, REVISED_ITEM_NO: @form.REVISED_ITEM_NO, SEQ_NO: @form.SEQ_NO, STATUS: @form.STATUS, SUBMITTERS_EMAIL: @form.SUBMITTERS_EMAIL, SUBMITTER_COMPANY: @form.SUBMITTER_COMPANY, SUBMITTER_NAME: @form.SUBMITTER_NAME, TEXT_FILE_NAME: @form.TEXT_FILE_NAME, TYPE_OF_DOCUMENT: @form.TYPE_OF_DOCUMENT, TYPE_OF_POLICY: @form.TYPE_OF_POLICY, UPDATED_BY: @form.UPDATED_BY, UPDATED_DATE: @form.UPDATED_DATE }
    assert_redirected_to form_path(assigns(:form))
  end

  test "should destroy form" do
    assert_difference('Form.count', -1) do
      delete :destroy, id: @form
    end

    assert_redirected_to forms_path
  end
end
