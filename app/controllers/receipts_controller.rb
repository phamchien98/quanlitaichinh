class ReceiptsController < ApplicationController
  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = current_user.receipts.build receipt_params
  end

  private
  
  def receipt_params
    params.require(:receipt).permit :image
  end
end
