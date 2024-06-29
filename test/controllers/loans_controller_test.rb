require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get loans_home_url
    assert_response :success
  end
end
