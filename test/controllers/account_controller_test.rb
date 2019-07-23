require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest

  def setup
  end

  def teardown
  end

  test "should not find ghost account" do
    get '/api/account/0', headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}

    assert_response :unauthorized
    assert_match "{\"message\":\"unauthorized\"}", response.body
  end

  test "should deny access for account 1 with wrong token" do
    get '/api/account/1', headers: {"token": ""}

    assert_response :unauthorized
    assert_match "{\"message\":\"unauthorized\"}", response.body
  end

  test "should get funds for account 1" do
    get '/api/account/1', headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}

    assert_response :success
    assert_match "{\"funds\":20.2}", response.body
  end

  test "should get funds for account 2" do
    get '/api/account/2', headers: {"token": "IlkyNjR5anlPeG1mWWVkYksi.eyJhbGciOiJIUzI1NiJ9.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}

    assert_response :success
    assert_match "{\"funds\":11.0}", response.body
  end

  test "should create new account" do
    post '/api/account', params: {account_id: 3, name: "Beth Joe", password: "123456"}, headers: {}

    assert_response :success
    assert_match "token", response.body
  end
end
