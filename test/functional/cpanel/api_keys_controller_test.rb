require 'test_helper'

class Cpanel::ApiKeysControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
