require 'test_helper'

class User::StockListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_stock_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get user_stock_lists_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_stock_lists_edit_url
    assert_response :success
  end

end
