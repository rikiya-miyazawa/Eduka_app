require "test_helper"

class TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tops_index_url
    assert_response :success
  end

  test "should get menu" do
    get tops_menu_url
    assert_response :success
  end
end
