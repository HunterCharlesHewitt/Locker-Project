require 'test_helper'

class LockerControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create locker" do
    get :new 
    post :create, :locker => {"student" => "hunter", "number" => "1", "size" => "m"}
    assert_redirected_to '/locker'
  end

end
