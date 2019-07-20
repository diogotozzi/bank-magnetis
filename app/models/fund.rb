class Fund < ActiveRecord::Base
  belongs_to :account

  self.primary_key = "id"
end
