require "test_helper"

class JsonUploadControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get json_upload_upload_url
    assert_response :success
  end

  test "should get show" do
    get json_upload_show_url
    assert_response :success
  end
end
