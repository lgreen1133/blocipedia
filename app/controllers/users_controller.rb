class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
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

  def update
    puts "*"*80
    puts session[:user_id]
    puts "*"*80

    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated successfully."
    else
      flash[:notice] = "Invalid user information"
    end
    redirect_to edit_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
