require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => {:login => 'charlie', :email => 'charlie@example.com'}
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    get :show, :id => users(:alice).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users(:alice).id
    assert_response :success
  end

  test "should update user" do
    put :update, :id => users(:alice).id, :user => { }
    assert_redirected_to users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:alice).id
    end

    assert_redirected_to users_path
  end
end
