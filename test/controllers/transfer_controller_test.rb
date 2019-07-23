require 'test_helper'

class TransferControllerTest < ActionDispatch::IntegrationTest

  def setup
  end

  def teardown
  end

  test "should not transfer successfuly without password confirmation" do
    post '/api/transfer', params: {from_account_id: 1, to_account_id: 2, qty: "1.20"}, headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}

    assert_response :forbidden
  end

  test "should not transfer successfuly without token" do
    post '/api/transfer', params: {from_account_id: 1, to_account_id: 2, qty: "1.20", password: "123456"}

    assert_response :unauthorized
  end

  test "should deposit successfuly to the same account" do
    post '/api/transfer', params: {from_account_id: 1, to_account_id: 1, qty: "20", password: "123456"}, headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}
    assert_response :success
  end

  test "should transfer successfuly with password confirmation to other account" do
    post '/api/transfer', params: {from_account_id: 1, to_account_id: 2, qty: "1.20", password: "123456"}, headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}
    assert_response :success
  end
end
