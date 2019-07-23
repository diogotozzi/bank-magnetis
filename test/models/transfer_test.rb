require 'test_helper'

class TransferTest < ActiveSupport::TestCase

  def setup
  end

  def teardown
  end

  test "should not accept empty to account IDs" do
    transfer = Transfer.new(from_account_id: 999, qty: 10.00)
    assert_not transfer.save
  end

  test "should not accept empty from account IDs" do
    transfer = Transfer.new(to_account_id: 888, qty: 10.00)
    assert_not transfer.save
  end

  test "should save new transfer" do
    transfer = Transfer.new(from_account_id: 999, to_account_id: 888, qty: 10.00)
    assert transfer.save
  end

end
