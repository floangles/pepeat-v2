class ProfilesController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!


  def show
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

  def croping
    @picture = current_user.chief_pictures.find(params[:format])
  end


  def rating
  end

  def set_user
    @user = current_user
  end


  def user_params
    params.require(:user).permit(:chief, :birth, :firstname, :phone_number, :surname, :lastname, :picture, :email, :address, :description, :chiefpicture, :picture_original_w, :picture_original_h, :picture_box_w, :picture_aspect, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h)
  end


  def chief_params
    params.require(:user).permit(:chief)
  end

end
