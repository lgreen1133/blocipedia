class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:notice] = "Please confirm your email address to continue."
      redirect_to root_path
    else
      flash[:error] = "Something went wrong. Please try again."
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
