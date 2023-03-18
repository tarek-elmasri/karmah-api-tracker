class AccountsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin, only: [:create]
  
  def index
    render json: Account.all
  end

  def create
    account = Account.new(accounts_params)
    if account.save
      head :created
    else
      render json: account.errors, status: 422
    end 
  end

  private
  def accounts_params
    params.require(:account).permit(:name, :area_id)
  end
end
