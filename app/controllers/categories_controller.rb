class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :of_categories]
  skip_before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
  end

  def of_categories
    @title = "of_categories"
    @consumables = @category.of_categories
  end

  private

  def find_category
    @category = Category.find_by(id: params[:id])
    unless @category
      redirect_to root_path
      flash[:danger] = "category not found"
    end
  end
end
