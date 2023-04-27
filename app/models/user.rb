class User < ApplicationRecord
  has_secure_password
  has_many :user_accounts
  has_many :accounts, through: :user_accounts
  has_many :plans

  ROLES = ["user", "admin"].freeze

  validates :username , presence: true, uniqueness: true
  validates :fullname, presence: true
  validates :password , length: {minimum: 5}
  validates :role, inclusion: ROLES
  
  before_create :add_salt_to_password
  after_create :set_refresh_token

  #scope :details, -> {select(:id, :role, :username, :fullname)}
  scope :include_accounts, -> {includes(user_accounts: [:account])}

  def self.authenticate credentials
    return nil unless credentials[:username] && credentials[:password]

    username = credentials[:username]
    salt = Rails.application.credentials.dig(:salt)
    password = credentials[:password] + salt

    find_by({username: username})&.authenticate(password)
  end
  
  def tokens(expires_in=1.hour.from_now.to_i)
    access_token = Tokens.encode({id: id, exp: expires_in})
    return {
      access_token: access_token,
      refresh_token: self.token
    }
  end

  def reset_token
    update_attribute(:token, Tokens.encode({id: id}))
  end

  def is_admin?
    role == "admin"
  end

  private

  def add_salt_to_password
    self.password = self.password + Rails.application.credentials.dig(:salt)
  end

  def set_refresh_token
    update!(token: Tokens.encode({id: id}))
  end



end
