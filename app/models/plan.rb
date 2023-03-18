class Plan < ApplicationRecord

  
  belongs_to :user
  belongs_to :area
  
  has_many :plan_accounts, inverse_of: :plan
  has_many :accounts ,  through: :plan_accounts
  
  accepts_nested_attributes_for :plan_accounts

  default_scope {
    includes(:area, :user, plan_accounts: [:account])
  }


end
