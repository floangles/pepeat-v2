module Profile
  class MealsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_meal, only: [:show, :edit, :update, :destroy]


    def index
      @meals = policy_scope(Meal)
      @meals = current_user.meals
    end

    def show
    end

    def new
      @meal = Meal.new
      authorize @meal
    end

    def create

      @meal = current_user.meals.new(meal_params)
      authorize @meal
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
      authorize @meal
    end

    def update
      authorize @meal
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
      authorize @meal
    end

    def set_meal
      @meal = current_user.meals.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:starter, :main, :dessert, :price, :title, :portion, :description, :start_hour, :end_hour, :day, :picture, :takeaway)
    end

  end
end
