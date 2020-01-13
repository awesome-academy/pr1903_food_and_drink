class CartItemsController < ApplicationController
  before_action :find_cart, only: [:create, :update, :destroy]
  before_action :check_logged_in

  def create
    @cart_item = @cart.cart_items.new(cart_items_params)
    @cart.status = 1
    @cart.save
    session[:cart_id] = @cart.id
    redirect_to @cart
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = @cart.cart_items
  end

private

  def check_logged_in
    redirect_to root_path unless logged_in?
  end

  def find_cart
    @cart = current_cart
  end

  def cart_items_params
    params.require(:cart_item).permit(:quantity, :consumable_id, :unit_price)
  end
end
