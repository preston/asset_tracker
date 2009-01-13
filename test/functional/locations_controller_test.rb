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
    post :create, :location => {:name => 'Home'}
    assert_equal old_count+1, Location.count
    
    assert_redirected_to location_path(assigns(:location))
  end

  def test_should_show_location
    get :show, :id => locations(:conference)
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => locations(:conference)
    assert_response :success
  end
  
  def test_should_update_location
    put :update, :id => locations(:conference), :location => { }
    assert_redirected_to location_path(assigns(:location))
  end
  
  def test_should_destroy_location
    old_count = Location.count
    delete :destroy, :id => locations(:conference).id
    assert_equal old_count-1, Location.count
    
    assert_redirected_to locations_path
  end
end
