class Transfer < ActiveRecord::Base
  validates :from_account_id, presence: true
  validates :to_account_id, presence: true
end
