require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset" do
    assert_difference('asset.count') do
      post :create, :asset => { }
    end

    assert_redirected_to assets_path
  end

  test "should show asset" do
    get :show, :id => assets(:alice_macbook).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => assets(:alice_macbook).id
    assert_response :success
  end

  test "should update asset" do
    put :update, :id => assets(:alice_macbook).id, :asset => { }
    assert_redirected_to assets_path
  end

  test "should destroy asset" do
    assert_difference('asset.count', -1) do
      delete :destroy, :id => assets(:alice_macbook).id
    end

    assert_redirected_to assets_path
  end
end
