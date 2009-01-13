require 'test_helper'

class ModelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model" do
    assert_difference('Model.count') do
      post :create, :model => {:name => 'Ninjitsu 5000', :manufacturer_id => manufacturers(:apple).id, :kind_id => kinds(:laptop).id}
    end

    assert_redirected_to models_path
  end

  test "should show model" do
    get :show, :id => models(:macbook).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => models(:macbook).id
    assert_response :success
  end

  test "should update model" do
    put :update, :id => models(:macbook).id, :model => { }
    assert_redirected_to models_path
  end

  test "should destroy model" do
    assert_difference('Model.count', -1) do
      delete :destroy, :id => models(:macbook).id
    end

    assert_redirected_to models_path
  end
end
