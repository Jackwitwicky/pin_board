class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to Pin Board"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      flash[:success] = "Your settings have been saved"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
