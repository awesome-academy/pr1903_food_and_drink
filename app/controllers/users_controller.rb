class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update]
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @user = User.new
  end

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t(".welcome to Foods and Drinks")
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
    unless @user
     redirect_to root_path
     flash[:danger] = "User not found"
   end
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    unless @user == current_user
      redirect_to(root_url)
    end
  end
end
