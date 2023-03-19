class AreasController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin, only: [:create]

  before_action :set_area, only: [:show, :update]
  def index
    if(Current.user.is_admin?)
      render json: Area.all.include_accounts
    else 
      render json: Area.by_user(Current.user)#[0].accounts
    end
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
    render json: @area 
  end

  def update

  end

  private
  def areas_params
    params.require(:area).permit(:name)
  end

  def set_area
    @area = Area.include_plans.find_by(id: params[:id])
    head :not_found unless @area
  end
end
