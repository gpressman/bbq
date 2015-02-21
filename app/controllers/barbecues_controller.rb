class BarbecuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @barbecues = Barbecue.order(:date)
  end

  def new
    @bbq = Barbecue.new
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end

  def showbbq
    bbq = Barbecue.where(id: params[:id]).first
   render(json: bbq)
  end

  def join
    barbecue= Barbecue.where(id: params[:id]).first
    user= current_user
    unless barbecues.users.include?(user)
     barbecue.users.push(user)b
     render(json: complete = {"status" => "joined"})
    end
  end
end
