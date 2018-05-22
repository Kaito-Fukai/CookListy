require 'test_helper'

class User::ShoppingListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_shopping_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get user_shopping_lists_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_shopping_lists_edit_url
    assert_response :success
  end

end
