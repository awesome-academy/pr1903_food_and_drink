class ConsumablesController < ApplicationController
  before_action :set_consumable, only: [:edit, :update, :show, :destroy]

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
    respond_to do |format|
      format.js
    end
  end
  
  def update
    if @consumable.update_attributes(consumable_params)
      respond_to do |format|
        format.js
      end      
    else
      render :index
      flash[:danger] = "consumable not created"
    end

  end
  
  def show  
  end
  
  def destroy
  
  end

  private

  def set_consumable
    @consumable = Consumable.find(params[:id])
  end

  def consumable_params
    params.require(:consumable).permit()
  end
end
