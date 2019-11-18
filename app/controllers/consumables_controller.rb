class ConsumablesController < ApplicationController
  before_action :find_consumable, except: [:index, :new, :create]
  before_action :find_consumables, except: [:show]

  def index
  end
  
  def new
    @consumable = Consumable.new
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @consumable = Consumable.new(consumable_params)
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
    @consumable.discard
    respond_to do |format|
      format.js
    end
  end

  private

  def find_consumables
    consumables = Consumable.all
    @consumables = consumables.not_discarded.paginate(page: params[:page], per_page: 10)
  end

  def find_consumable
    @consumable = Consumable.find_by(id: params[:id])
    redirect_to root_path
    flash[:danger] = "Consumable not found"
  end

  def consumable_params
    params.require(:consumable).permit(:name, :description, :price, :quantity, pictures: [])
  end
end
