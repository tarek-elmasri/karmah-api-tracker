class UserAccount < ApplicationRecord
  belongs_to :user
  belongs_to :account

  validates :user, presence: true
  validates :account, presence: true
  validates :user_id, uniqueness: {scope: :account_id}
end
