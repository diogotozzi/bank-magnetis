class Account < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true
  validates :password, presence: true

  self.primary_key = "id"
end
