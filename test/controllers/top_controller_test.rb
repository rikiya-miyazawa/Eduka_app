require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_index_url
    assert_response :success
  end

  test "should get menu" do
    get top_menu_url
    assert_response :success
  end
end
