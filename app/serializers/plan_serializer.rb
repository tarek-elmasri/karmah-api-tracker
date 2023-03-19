class PlanSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date

  has_one :area
  has_one :user
  has_many :plan_accounts
  
end
