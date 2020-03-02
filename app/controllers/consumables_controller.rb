class ConsumablesController < ApplicationController
  include ConsumablesHelper

  before_action :find_consumable, except: [:index, :new, :create]
  before_action :find_consumables, except: [:show]

  def index
    @categories = Category.all
    @cart_item = current_cart.cart_items.new if logged_in?
    @consumables = if params[:term]
      Consumable.by_name(params[:term]).paginate(page: params[:page])
    else
      Consumable.all.paginate(page: params[:page])
    end
  end

  def show
    @rating = calculate_rate(@consumable.ratings)
  end

  private
  def find_consumables
    consumables = Consumable.all
    @consumables = consumables.not_discarded.paginate(page: params[:page], per_page: 10)
  end

  def find_consumable
    @consumable = Consumable.find_by(id: params[:id])
    unless @consumable
      redirect_to root_path
      flash[:danger] = "Consumable not found"
    end
  end

  def consumable_params
    params.require(:consumable).permit(:name, :description, :price, :quantity, pictures: [])
  end
end
