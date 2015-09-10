class ProfilesController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to profile_path
    else
      render :edit
    end
  end


  def set_user
    @user = current_user
  end


  def user_params
    params.require(:user).permit(:firstname, :lastname, :picture, :email, :address, :description)
  end

end
