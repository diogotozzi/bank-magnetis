class Account < ActiveRecord::Base
  validates :id, presence: true, uniqueness: true

  self.primary_key = "id"
end
