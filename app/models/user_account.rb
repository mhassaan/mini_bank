class UserAccount < ApplicationRecord
  belongs_to :user
  belongs_to :account
  validates_uniqueness_of :account_id
end
