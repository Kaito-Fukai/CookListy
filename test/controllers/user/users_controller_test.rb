require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_users_show_url
    assert_response :success
  end

  test "should get editt" do
    get user_users_editt_url
    assert_response :success
  end

end
