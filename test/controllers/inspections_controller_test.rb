require 'test_helper'

class InspectionsControllerTest < ActionController::TestCase
  setup do
    @inspection = inspections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inspections)
  end

  test "should create inspection" do
    assert_difference('Inspection.count') do
      post :create, inspection: {  }
    end

    assert_response 201
  end

  test "should show inspection" do
    get :show, id: @inspection
    assert_response :success
  end

  test "should update inspection" do
    put :update, id: @inspection, inspection: {  }
    assert_response 204
  end

  test "should destroy inspection" do
    assert_difference('Inspection.count', -1) do
      delete :destroy, id: @inspection
    end

    assert_response 204
  end
end
