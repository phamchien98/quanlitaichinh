class PlansController < ApplicationController
  before_action :set_plan,  only: %i(edit update destroy)

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
    @activities = Activity.select("time, SUM(IF(status = 1, money, 0)) AS thu, SUM(IF(status = 0, money, 0)) AS chi")
                          .where(user_id: current_user.id)
                          .where(time: Date.new(2020,11,1)..Date.new(2021,5,-1))
                          .group(:time)
                          .order(time: :ASC)

    @statistics = Plan.joins("LEFT JOIN users ON users.id = plans.user_id 
                            LEFT JOIN activities ON activities.user_id = users.id AND activities.time >= plans.start_date AND activities.time <= plans.end_date ")
                      .select("plans.id AS id,start_date,end_date,plan_money_come,plan_money_out,SUM(IF(activities.status = 1,activities.money,0)) AS money_come,SUM(IF(activities.status = 0,activities.money,0)) AS money_out")
                      .where(user_id: current_user.id)
                      .group(:id)	
    p @statistics
    @q = @statistics.ransack(params[:q])
    @statistics = @q.result.page(params[:page]).per(10)
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      flash[:success] = "Success edit plan"
      redirect_to user_plans_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    flash[:success] = "Plan deleted"
    redirect_to user_plans_path(current_user.id)
  end

  private
  
  def plan_params
    params.require(:plan).permit :start_date, :end_date, :plan_money_come, :plan_money_out
  end

  def set_plan
    @plan = current_user.plans.find_by(id: params[:id])
    redirect_to root_url if @plan.nil?
  end
end
