class ConsumablesController < ApplicationController
  def index
    @consumables = Consumable.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @consumable = Consumable.new
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @consumable = Consumable.new
    if @consumable.save
      respond_to do |format|
        format.js
      end
    else
      render :index
    end
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def show
  
  end
  
  def destroy
  
  end
end
