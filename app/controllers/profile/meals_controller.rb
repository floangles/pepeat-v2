module Profile
  class MealsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_meal, only: [:show, :edit, :update, :destroy]


    def index
      @meals = current_user.meals
    end

    def show
    end

    def new
      @meal = Meal.new
    end

    def create
      @meal = current_user.meals.new(meal_params)
      if @meal.save
        if params[:pictures]
          params[:pictures].each { |picture|
            @meal.meal_pictures.create(picture: picture)
          }
        end
         redirect_to profile_meals_path
      else
        render :new
      end
    end

    def edit

    end

    def update
      @meal.update(meal_params)
      if @meal.save
        if params[:pictures]
          @meal.meal_pictures.delete_all
          params[:pictures].each {|picture|
            @meal.meal_pictures.create(picture: picture )
          }
        end
        redirect_to profile_meals_path
      else
        render :edit

      end
    end

    def destroy
    end

    def set_meal
      @meal = current_user.meals.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:starter, :main, :dessert, :price, :portion, :description, :start_hour, :end_hour, :day, :picture, :takeaway)
    end

  end
end
