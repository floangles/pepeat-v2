module Profile
  class MealPicturesController < ApplicationController

    before_action :authenticate_user!

    def create
      @user = current_user
      @meal_picture = @user.meal_pictures.build(meal_picture_params)
      if @meal_picture.save
        redirect_to profile_path
      else
        render :new
      end
    end

    def new
      @user = current_user
      @meal_picture = MealPicture.new
    end

    def destroy
      @meal = Meal.find(params[:meal])
      @meal_picture = @meal.meal_pictures.find(params[:id])
      @meal_picture.destroy
      redirect_to edit_profile_meal_path(@meal)
    end


    def meal_picture_params
      params.require(:meal_picture).permit(:mealpicture)
    end
  end
end
