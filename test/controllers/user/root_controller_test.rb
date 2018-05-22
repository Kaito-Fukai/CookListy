require 'test_helper'

class User::RootControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get user_root_top_url
    assert_response :success
  end

end
