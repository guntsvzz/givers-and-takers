require "test_helper"

class JsonFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get json_files_index_url
    assert_response :success
  end

  test "should get show" do
    get json_files_show_url
    assert_response :success
  end

  test "should get new" do
    get json_files_new_url
    assert_response :success
  end

  test "should get create" do
    get json_files_create_url
    assert_response :success
  end
end
