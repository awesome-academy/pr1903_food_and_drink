class CategoryConsumablesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @category_consunable = CategoryConsumable.new(category_params)
  end

  def create
    @category = Category.find_by(id: params[:id])
    @category_consunable = @category.CategoryConsumable.new(category_params)
    respond_to do |format|
      if @category_consunable.save
        format.html{redirect_to(@category_consunable.consumable)}
        format.js
      end
    end
  end


  def destroy
    @category_consumable = CategoryConsumable.find_by(id: params[:id])
    consumable = @category_consunable.consumable
    respond_to do |format|
      if @category_consunable.destroy
        format.html{redirect_to(@category_consunable.consumable)}
      end
    end
  end

  private
  def category_params
    params.require(:categoryconsumables).permit(:conumable_id)
  end

  def logged_in_user
    if current_user.nil?
      redirect_to login_path
    end
  end

  def current_user?
    unless @user == current_user
      redirect_to 'login_path'
    end
  end
end
