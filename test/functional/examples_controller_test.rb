require 'test_helper'

class ExamplesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:examples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create example" do
    assert_difference('Example.count') do
      post :create, :example => { }
    end

    assert_redirected_to example_path(assigns(:example))
  end

  test "should show example" do
    get :show, :id => examples(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => examples(:one).id
    assert_response :success
  end

  test "should update example" do
    put :update, :id => examples(:one).id, :example => { }
    assert_redirected_to example_path(assigns(:example))
  end

  test "should destroy example" do
    assert_difference('Example.count', -1) do
      delete :destroy, :id => examples(:one).id
    end

    assert_redirected_to examples_path
  end
end
