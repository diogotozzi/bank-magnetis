require 'test_helper'

class TransferIntegrationTest < ActionDispatch::IntegrationTest

  def setup
  end

  def teardown
  end

  test "should deposit successfuly to the same account" do
    get '/api/account/1', headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}
    assert_response :success
    assert_match "{\"funds\":20.2}", response.body

    post '/api/transfer', params: {from_account_id: 1, to_account_id: 1, qty: "20", password: "123456"}, headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}
    assert_response :success

    get '/api/account/1', headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}
    assert_response :success
    assert_match "{\"funds\":40.2}", response.body
  end

  test "should transfer successfuly with password confirmation to other account" do
    post '/api/transfer', params: {from_account_id: 1, to_account_id: 2, qty: "1.20", password: "123456"}, headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}
    assert_response :success

    get '/api/account/1', headers: {"token": "eyJhbGciOiJIUzI1NiJ9.IlkyNjR5anlPeG1mWWVkYksi.Tc9IQuUdQ7IaVWORuQOLIpG1emnTikIkzvDOfVnThNU"}
    assert_response :success
    assert_match "{\"funds\":19.0}", response.body
  end
end
