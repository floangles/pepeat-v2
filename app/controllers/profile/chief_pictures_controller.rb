module Profile
  class ChiefPicturesController < ApplicationController

    before_action :authenticate_user!


    def create
      @user = current_user
      @chief_picture = @user.chief_pictures.build(chief_picture_params)
      if @chief_picture.save
        redirect_to profile_path
      else
        render :new
      end
    end

    def new
      @user = current_user
      @chief_picture = ChiefPicture.new
    end

    def update
      @user = current_user
      @chief_picture = current_user.chief_pictures.find(params[:id])
      @chief_picture.update(chief_picture_params)

      if @chief_picture.update(chief_picture_params)
        redirect_to profile_path
      else
        render :new
      end
    end

    def destroy
      @chief_picture = current_user.chief_pictures.find(params[:id])
      @chief_picture.destroy
      redirect_to profile_path
    end


    def chief_picture_params
      params.require(:chief_picture).permit(:chiefpicture, :chiefpicture_original_w, :chiefpicture_original_h, :chiefpicture_box_w, :chiefpicture_aspect, :chiefpicture_crop_x, :chiefpicture_crop_y, :chiefpicture_crop_w, :chiefpicture_crop_h)
    end
  end
end
