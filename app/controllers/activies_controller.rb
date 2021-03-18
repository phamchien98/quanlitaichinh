class ActiviesController < ApplicationController
  def index
    @activies = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.find_by(time:params.require(:activity).require(:time))
    if @activity.nil?
      @activity = Activity.new activity_params
      @activity.save
      redirect_to user_activies_path(current_user.id)
    else
      update
    end
   end

  def update
    @activity.update activity_params
    redirect_to user_activies_path(current_user.id)
  end

  def activity_params
    params.require(:activity).permit :status, :time, :money, :note
  end

  def edit
  end

end
