class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_path, notice: "Thank you for signing up."
    else
      render "new"
    end
  end

  def confirm_email
    # Find the user by confirmation_token
    @user = User.find_by_confirm_token(params[:id])
    @user.confirmation_token = nil
    @user.confirmed_at = Time.now

    if @user.save
      flash[:notice] = "Account confirmed. Please sign in to continue."
    else
      flash[:error] = "Please confirm your account."
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
