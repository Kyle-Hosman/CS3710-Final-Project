require "test_helper"

class InventoryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get inventory_show_url
    assert_response :success
  end
end
