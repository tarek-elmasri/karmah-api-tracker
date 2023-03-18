class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin

  def index
    render json: User.details.all
  end

  def create
    user = User.new(user_params)
    if user.save
      head :created
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :fullname, :password, :role)
  end
end
