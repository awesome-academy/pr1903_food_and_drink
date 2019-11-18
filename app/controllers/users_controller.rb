class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :show]
 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "welcome to Foods and Drinks"
      redirect_to @user
    else
      render :new
    end
  end

  def show   
  end

  def edit
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    unless @user
     redirect_to root_path
     flash[:danger] = "User not found"
   end
  end     
end
