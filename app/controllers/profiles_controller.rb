class ProfilesController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!


  def show
   skip_authorization
   @chief_picture = ChiefPicture.new
  end

  def edit
    skip_authorization
  end

  def update
    skip_authorization
    @user.update(user_params)
    if @user.save
     if params[:chiefpictures]
        params[:chiefpictures].each { |picture|
        @user.chief_pictures.create(chiefpicture: picture)
          }
    end
      redirect_to profile_path
    else
      render :edit
    end
  end


  def set_user
    @user = current_user
  end


  def user_params
    params.require(:user).permit(:firstname, :surname, :lastname, :picture, :email, :address, :description, :chiefpicture)
  end

end
