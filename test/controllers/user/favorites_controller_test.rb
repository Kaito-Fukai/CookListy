require 'test_helper'

class User::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_favorites_index_url
    assert_response :success
  end

  test "should get new" do
    get user_favorites_new_url
    assert_response :success
  end

end
