require 'test_helper'

class User::RecentlyCookedRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_recently_cooked_recipes_index_url
    assert_response :success
  end

end
