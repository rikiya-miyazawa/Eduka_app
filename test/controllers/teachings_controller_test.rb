require "test_helper"

class TeachingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teachings_new_url
    assert_response :success
  end

  test "should get edit" do
    get teachings_edit_url
    assert_response :success
  end

  test "should get show" do
    get teachings_show_url
    assert_response :success
  end
end
