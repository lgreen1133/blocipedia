class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def confirm
    # Find the user by confirmation_token
    @user = User.find_by(confirmation_token: params[:id])
    @user.confirmation_token = nil
    @user.confirmed_at = Time.now

    if @user.save
      flash[:notice] = "Account confirmed"
    else
      flash[:error] = "Please confirm your account."
    end
    redirect_to root_path
  end
end
