class UserAccountsController < ApplicationController

  before_action :authenticate_user
  before_action :authorize_admin
  before_action :set_target_user

  def update
    begin
      UserAccount.transaction do
        @target_user.user_accounts.destroy_all

        user_accounts = @target_user.user_accounts.create!(user_accounts_params)
        render json: user_accounts, status: :created
      end
    rescue => e
     head 422 
    end

  end

  def destroy
    @target_user.user_accounts.destroy_all
    head :ok
  end



  private
  def set_target_user
    @target_user = User.find_by(id: params.require(:user_id))
    head :not_found unless @target_user
  end

  def user_accounts_params
    params.permit(accounts: [:account_id]).require(:accounts)
  end
end