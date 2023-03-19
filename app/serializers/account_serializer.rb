class AccountSerializer < ActiveModel::Serializer
    attributes :id, :name

    has_one :area

    
end