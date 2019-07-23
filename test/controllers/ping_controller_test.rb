class PingControllerTest < ActionDispatch::IntegrationTest
  test "should get ping" do
    get api_ping_path
    assert_response :success
  end
end
