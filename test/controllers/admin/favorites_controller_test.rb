require 'test_helper'

class Admin::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_favorites_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_favorites_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_favorites_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_favorites_show_url
    assert_response :success
  end

end
