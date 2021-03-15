class ActiviesController < ApplicationController
  def index
    if params[:my_date].blank?
      year = DateTime.current.year
      month = DateTime.current.month
    else
      year = params[:my_date].to_date.year
      month = params[:my_date].to_date.month
    end

    @activies = current_user.activities.where(time: Date.new(year,month,1)..Date.new(year,month,-1))
  rescue => e
    redirect_to action: :index
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.create activity_params
    respond_to do |format|
      if @activity.save
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @activity.update activity_params
    redirect_to user_activies_path(current_user.id)
  end

  def sum_money
    @sum_money_come_day = 0
    @sum_money_out_day = 0

    if @activity.come? 
      @sum_money_come_day += @activity.money
    else
      @sum_money_out_day += @activity.money
    end
  end

  def activity_params
    params.require(:activity).permit :status, :time, :money, :note
  end

  def edit
  end

end
