require "test_helper"

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get giver" do
    get account_giver_url
    assert_response :success
  end

  test "should get taker" do
    get account_taker_url
    assert_response :success
  end

  test "should get settings" do
    get account_settings_url
    assert_response :success
  end
end
