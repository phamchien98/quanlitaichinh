class SearchReceiptsController < ApplicationController
  def index
    if params[:search].blank?
      render action: :index
    else
      @parameter = params[:search].downcase
      @result = current_user.receipts.where("content LIKE :search", search: "%#{@parameter}%")
      p @result
      render action: :index
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
  end
end
