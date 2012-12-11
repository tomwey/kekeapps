require 'test_helper'

class MoreGameControllerTest < ActionController::TestCase
  test "should get more" do
    get :more
    assert_response :success
  end

end
