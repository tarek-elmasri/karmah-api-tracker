class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin , except: [:show]
  before_action :authorize_show, only: [:show]

  def index
  render json: User.all, include: []
  end

  def create
    user = User.new(user_params)
    if user.save
      head :created
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  def show
    render json: Current.user, include: [:accounts]
  end

  private
  def user_params
    params.require(:user).permit(:username, :fullname, :password, :role)
  end

  def authorize_show
    head :forbidden unless Current.user.is_admin? || Current.user.id == params[:id] 
  end
end
