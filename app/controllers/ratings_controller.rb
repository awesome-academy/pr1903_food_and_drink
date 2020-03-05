class RatingsController < ApplicationController
  before_action :logged_in_user, only:[:create, :index]
  skip_before_action :authenticate_user!

  def create
    @rating = current_user.ratings.new(rating_params)
    consumable = @rating.consumable
    if @rating.save
      ratings = Rating.of_consumable(consumable).pluck(:rating)
      avg = Rating.calculate_average_rating(ratings)
      consumable.update(rate_average: avg)
      redirect_to @rating.consumable
    else
      flash[:success] = "rating 1..5"
      redirect_to @rating.consumable
    end
  end

  def index
    @ratings = Rating.all
  end

  private

  def current_user?
    unless @rating.user == current_user
      redirect_to @consumable
    end
  end

  def rating_params
    params.require(:rating).permit(:rating, :consumable_id)
  end

  def find_rating
    @rating = Rating.find_by(id: params[:id])
    unless @rating
      redirect_to root_path
      flash[:danger] = t(".rating not found")
    end
  end

  def logged_in_user
    if current_user.nil?
      redirect_to login_path
    end
  end
end
