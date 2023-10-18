require "test_helper"

class CustomizeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customize_index_url
    assert_response :success
  end
end
