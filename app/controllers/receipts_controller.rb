class ReceiptsController < ApplicationController
  def index
    if params[:my_date].blank?
      year = DateTime.current.year
      month = DateTime.current.month
    else
      year = params[:my_date].to_date.year
      month = params[:my_date].to_date.month
    end

    @receipts = current_user.receipts.where(time: Date.new(year,month,1)..Date.new(year,month,-1))
  rescue => e
    redirect_to action: :index
  end

  def new
    @receipt = Receipt.new
  end

  def create
    image_file = receipt_params[:image]
    time = receipt_params[:time]
    uri = URI('http://localhost:7000/query')
    req = Net::HTTP::Post.new(uri)
    req.set_form([['image', File.open(image_file)]], 'multipart/form-data')
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
    datas = JSON.parse(res.body)
    
    contents = []
    datas.values[0].each do |data|
      content = data.join(" ")
      contents.append(content)
    end
    p contents
    temp = {
      time: time,
      image: image_file,
      content: contents,
      activity_id: 1
    }
    
    @receipt = current_user.receipts.build temp
    if @receipt.save
      redirect_to user_activies_path
    else
      flash[:alert] = "Error create receipt"
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  private
  
  def receipt_params
    params.require(:receipt).permit :image, :time
  end
end
