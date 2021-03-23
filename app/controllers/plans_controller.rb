class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def create
    @plan = current_user.plans.build plan_params
    if @plan.save
      flash[:success] = "Success create plan"
      redirect_to user_plans_path(current_user.id)
    else
      flash[:alert] = "Error create plan"
      render :new
    end
  end

  def index
    @plans = Plan.all
  end

  private
  
  def plan_params
    params.require(:plan).permit :start_date, :end_date, :plan_money_come, :plan_money_out
  end
end
