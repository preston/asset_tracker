require 'test_helper'

class KindsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kind" do
    assert_difference('Kind.count') do
      post :create, :kind => {:name => 'Phone'}
    end

    assert_redirected_to kinds_path
  end

  test "should show kind" do
    get :show, :id => kinds(:laptop).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kinds(:laptop).id
    assert_response :success
  end

  test "should update kind" do
    put :update, :id => kinds(:laptop).id, :kind => { }
    assert_redirected_to kinds_path
  end

  test "should destroy kind" do
    assert_difference('Kind.count', -1) do
      delete :destroy, :id => kinds(:laptop).id
    end

    assert_redirected_to kinds_path
  end
end
