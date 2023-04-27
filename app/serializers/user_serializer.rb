class UserSerializer < ActiveModel::Serializer
  attributes :id, :username , :fullname, :role

  has_many :accounts, through: :user_accounts
end
