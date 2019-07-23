require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  def setup
  end

  def teardown
  end

  test "should not accept empty ID" do
    account = Account.new(name: "John Doe", password: "123456")
    assert_not account.save
  end

  test "should not accept empty password" do
    account = Account.new(id: 999, name: "John Doe")
    assert_not account.save
  end

  test "shold not accept two identical IDs" do
    account1 = Account.new(id: 999, name: "John Doe", password: "123456")
    account2 = Account.new(id: 999, name: "Bob Doe", password: "123456")

    assert account1.save
    assert_not account2.save
  end

  test "should save new account" do
    account = Account.new(id: 999, name: "John Doe", password: "123456")
    assert account.save
  end
end
