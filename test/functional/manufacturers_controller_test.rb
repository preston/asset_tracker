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
      post :create, :manufacturer => { }
    end

    assert_redirected_to manufacturer_path(assigns(:manufacturer))
  end

  test "should show manufacturer" do
    get :show, :id => manufacturers(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => manufacturers(:one).id
    assert_response :success
  end

  test "should update manufacturer" do
    put :update, :id => manufacturers(:one).id, :manufacturer => { }
    assert_redirected_to manufacturer_path(assigns(:manufacturer))
  end

  test "should destroy manufacturer" do
    assert_difference('Manufacturer.count', -1) do
      delete :destroy, :id => manufacturers(:one).id
    end

    assert_redirected_to manufacturers_path
  end
end
