class Area < ApplicationRecord
  has_many :accounts
  has_many :plans
  
  validates :name, presence: true

  scope :include_accounts, -> {includes(:accounts)}
  scope :by_user, -> (user) {
    includes(:accounts)
    .where({
      accounts: {id: user.accounts.ids}
    })
  }
    
end
