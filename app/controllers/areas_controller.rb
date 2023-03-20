class AreasController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin, only: [:create]

  def index
      render json: Area.by_user(Current.user), include: 'accounts'
  end

  def create
    area= Area.new(areas_params)
    if area.save
      head :created
    else
      render json: area.errors, status: 422
    end
  end
  
  def show
    area = Area.by_user(Current.user).include_plans.order('plans.start_date DESC').find_by(id: params[:id])
    head :not_found unless area
    render json: area , include: ['plans.plan_accounts','plans.user', 'accounts']
  end

  def update

  end

  private
  def areas_params
    params.require(:area).permit(:name)
  end

  
end
