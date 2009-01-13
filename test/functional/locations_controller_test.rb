require File.dirname(__FILE__) + '/../test_helper'
require 'locations_controller'

# Re-raise errors caught by the controller.
class LocationsController; def rescue_action(e) raise e end; end

class LocationsControllerTest < Test::Unit::TestCase
  fixtures :locations

  def setup
    @controller = LocationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:locations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_location
    old_count = Location.count
    post :create, :location => { }
    assert_equal old_count+1, Location.count
    
    assert_redirected_to location_path(assigns(:location))
  end

  def test_should_show_location
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_location
    put :update, :id => 1, :location => { }
    assert_redirected_to location_path(assigns(:location))
  end
  
  def test_should_destroy_location
    old_count = Location.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Location.count
    
    assert_redirected_to locations_path
  end
end
