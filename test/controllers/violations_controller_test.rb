require 'test_helper'

class ViolationsControllerTest < ActionController::TestCase
  setup do
    @violation = violations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:violations)
  end

  test "should create violation" do
    assert_difference('Violation.count') do
      post :create, violation: {  }
    end

    assert_response 201
  end

  test "should show violation" do
    get :show, id: @violation
    assert_response :success
  end

  test "should update violation" do
    put :update, id: @violation, violation: {  }
    assert_response 204
  end

  test "should destroy violation" do
    assert_difference('Violation.count', -1) do
      delete :destroy, id: @violation
    end

    assert_response 204
  end
end
