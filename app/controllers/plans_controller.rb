class PlansController < ApplicationController

  before_action :authenticate_user

  def index
    if Current.user.is_admin?
      render json: Plan.all.order(updated_at: :desc)
    else
      render json: Current.user.plans.order(updated_at: :desc)
    end
  end


  def create
    # validation to account ids to ensure it belongs to current user is required
    plan = Current.user.plans.build(plans_params)  
    if plan.save
      render json: plan, status: :created
    else
      render json: plan.errors, status: :unprocessable_entity
    end
  end


  private
  def plans_params
    params.require(:plan).permit(
      :area_id, 
      :start_date, 
      :end_date, 
      plan_accounts_attributes: [:account_id, :objective]
    )
  end
end