class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :accounts
  
  has_many :plans
end
