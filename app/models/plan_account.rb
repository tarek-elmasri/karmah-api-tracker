class PlanAccount < ApplicationRecord
  belongs_to :plan
  belongs_to :account
end
