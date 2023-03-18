class SessionsController < ApplicationController
  before_action :authenticate_user, except: [:update, :create]


  def index
      render json: Current.user, status: :ok
  end

  def create
    user = User.authenticate(sessions_params)
    if user
      render json: user.tokens
    else
      head :not_found
    end
  end


  def destroy
    Current.user.reset_token
    head :ok
  end

  def update
    user = User.find_by(token: params.require(:refresh_token))
    if user
      render json: user.tokens
    else
      head :not_found
    end
  end

  private
  def sessions_params
    params.permit(:username, :password)
  end


end
