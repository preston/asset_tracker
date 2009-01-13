require 'test_helper'

class ManufacturersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manufacturers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manufacturer" do
    assert_difference('Manufacturer.count') do
      post :create, :manufacturer => {:name => 'Microsoft'}
    end

    assert_redirected_to manufacturers_path
  end

  test "should show manufacturer" do
    get :show, :id => manufacturers(:apple).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => manufacturers(:apple).id
    assert_response :success
  end

  test "should update manufacturer" do
    put :update, :id => manufacturers(:apple).id, :manufacturer => { }
    assert_redirected_to manufacturers_path
  end

  test "should destroy manufacturer" do
    assert_difference('Manufacturer.count', -1) do
      delete :destroy, :id => manufacturers(:apple).id
    end

    assert_redirected_to manufacturers_path
  end
end
