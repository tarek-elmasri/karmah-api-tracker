class ApplicationController < ActionController::API

  def authenticate_user
    begin
      raise Error.new("No Token") unless access_token

      payload = Tokens.decode(access_token)
      Current.user = User.find(payload[:id])
      
    rescue => e
      head :unauthorized
    end
  end

  def authorize_admin
    head :forbidden unless Current.user&.is_admin?
  end
  
  private
  def access_token
    request.headers['Authorization']
          &.split("Bearer ")
          &.last
  end

end
