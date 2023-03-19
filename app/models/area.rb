class Area < ApplicationRecord
  has_many :accounts
  has_many :plans
  
  validates :name, presence: true

  scope :include_accounts, -> {includes(:accounts)}
  scope :include_plans, -> {includes(plans: [:user, :plan_accounts])}
  
  scope :by_user, lambda { |user|
    user.is_admin? ? 
      includes(:accounts) : includes(:accounts)
                                .where({accounts: {id: user.accounts.ids}})
  }
    
end
