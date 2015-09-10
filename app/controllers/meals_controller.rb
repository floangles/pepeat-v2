class MealsController < ApplicationController

  def index
    @users = User.all
    @meals = Meal.all
    @order = Order.new
  end

  def show
    @meal = Meal.find(params[:id])
  end
end
