class AreasController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin, only: [:create]

  def index
    render json: Area.by_user(Current.user)#[0].accounts
    #render json: Area.include_accounts

  end

  def create
    area= Area.new(areas_params)
    if area.save
      head :created
    else
      render json: area.errors, status: 422
    end
  end

  def update

  end

  private
  def areas_params
    params.require(:area).permit(:name)
  end
end
