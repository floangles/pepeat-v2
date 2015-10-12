class HomeController < ApplicationController
  def index
    @meals = Meal.all
    @order = Order.new
  end
end
