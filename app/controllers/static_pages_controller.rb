class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @categories = Category.all.includes(:consumables)
  end

  def help; end

  def about; end
end
