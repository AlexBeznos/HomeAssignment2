require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get research" do
    get :research
    assert_response :success
  end

end
