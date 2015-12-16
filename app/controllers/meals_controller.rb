class MealsController < ApplicationController

  def index
    @meals = policy_scope(Meal)
    @users = User.all
    @order = Order.new
  end

  def show

    @meal = Meal.find(params[:id])
    authorize @meal
    @order = Order.new
    @user = @meal.user


    @markers = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.picture({
       "url" => "/assets/marker.png",
       "width" =>  0,
       "height" => 0,
       })
    end
  end
end
