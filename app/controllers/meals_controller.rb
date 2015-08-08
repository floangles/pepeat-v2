class MealsController < ApplicationController

  def index
    @users = User.all
    @meals = Meal.all
    @order = Order.new

    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

end
