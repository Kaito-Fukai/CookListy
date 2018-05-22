require 'test_helper'

class Admin::AdministratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_administrators_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_administrators_edit_url
    assert_response :success
  end

end
