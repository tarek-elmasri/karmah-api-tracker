class Tokens

  def self.encode payload
    JWT.encode(payload, jwt_secret, 'HS256')
  end

  def self.decode token
    JWT.decode(token, jwt_secret, 'HS256')[0].symbolize_keys
  end

  private
  def self.jwt_secret
    Rails.application.credentials.dig(:jwt_secret)
  end

    

end
