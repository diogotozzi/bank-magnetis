class Account < ActiveRecord::Base
  has_many :funds, dependent: :destroy

  self.primary_key = "id"
end
