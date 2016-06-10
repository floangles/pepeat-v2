module Profile
  class MealPicturesController < ApplicationController

    before_action :authenticate_user!

    def create
      @meal = Meal.find(params[:meal_id])
      @user = current_user
      @meal_picture = @meal.meal_pictures.build(meal_picture_params)
      if @meal_picture.save
        redirect_to mealcrop_profile_meals_path(@meal_picture, meal_id: params[:meal_id])
      else
        render :new
      end
    end

    def new
      @user = current_user
      @meal_picture = MealPicture.new
    end

    def destroy
      @meal = Meal.find(params[:meal_id])
      @meal_picture = @meal.meal_pictures.find(params[:id])
      @meal_picture.destroy
      redirect_to mealpic_profile_meals_path(meal_id: @meal.id)
    end

    def update
      @meal = Meal.find(params[:meal_id])
      @meal_picture = @meal.meal_pictures.find(params[:id])
      @meal_picture.update(meal_picture_params)

      if @meal_picture.update(meal_picture_params)
        redirect_to mealpic_profile_meals_path(meal_id: @meal.id)
      else
        render :new
      end
    end

    private

    def meal_picture_params
      params.require(:meal_picture).permit(:picture, :picture_original_w, :picture_original_h, :picture_box_w, :picture_aspect, :picture_crop_x, :picture_crop_y, :picture_crop_w, :picture_crop_h)
    end
  end
end
