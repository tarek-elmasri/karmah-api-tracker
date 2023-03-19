class PlanAccountSerializer < ActiveModel::Serializer
    attributes :id, :objective

    has_one :plan
    has_one :account


end