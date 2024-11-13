require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get giver" do
    get accounts_giver_url
    assert_response :success
  end

  test "should get taker" do
    get accounts_taker_url
    assert_response :success
  end

  test "should get settings" do
    get accounts_settings_url
    assert_response :success
  end
end
