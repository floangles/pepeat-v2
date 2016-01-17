class MealsController < ApplicationController

  def all(chief)

    @users = []
    chief.each do |user|
      if user.meals.count > 0
        user.meals.each do |meal|
          if meal.day > DateTime.now.to_date - 1.days && meal.validation?
            @users << user
          end
        end
      end
    end
  end

  def who_cook(i)
    @people = []
    @meals_selection = []
    @users_0 = []
    @users_1 = []
    @users_2 = []
    @users_3 = []
    @users_4 = []
    @users_5 = []
    @users_6 = []

    Meal.all.each do |meal|

      if ((DateTime.now + i.days).day == meal.day.day || j == meal.day.day) && meal.day > DateTime.now.to_date - 1.days && meal.validation?
        @meals_selection << meal
      end
    end

    @meals_selection.each do |meal|

      if i == 0
        @users_0 << meal.user
      elsif i == 1
        @users_1 << meal.user
      elsif i == 2
        @users_2 << meal.user
      elsif i == 3
        @users_3 << meal.user
      elsif i == 4
        @users_4 << meal.user
      elsif i == 5
        @users_5 << meal.user
      elsif i == 6
        @users_6 << meal.user
      end
    end
  end

  def index
    @meals = policy_scope(Meal)
    @order = Order.new

    # all

    @chief = User.all.where(chief: true)
    all(@chief)

    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.infowindow "#{user.firstname} #{user.lastname}"
        marker.json({ id: user.id })
    end

    # all

    # day 1

    who_cook(0)
    @markers_0 = Gmaps4rails.build_markers(@users_0) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.json({ id: user.id })
    end

    # day 1

    # day 2
    who_cook(1)
    @markers_1 = Gmaps4rails.build_markers(@users_1) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.json({ id: user.id })
    end
    # day 2

    # day 3
    who_cook(2)
    @markers_2 = Gmaps4rails.build_markers(@users_2) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.json({ id: user.id })
    end
    # day 3

    # day 4
    who_cook(3)
    @markers_3 = Gmaps4rails.build_markers(@users_3) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.json({ id: user.id })
    end
    # day 4

    # day 5
    who_cook(4)
    @markers_4 = Gmaps4rails.build_markers(@users_4) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.json({ id: user.id })
    end

    # day 5

    # day 6
    who_cook(5)
    @markers_5 = Gmaps4rails.build_markers(@users_5) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.json({ id: user.id })
    end
    # day 6

    # day 7
    who_cook(6)
    @markers_6 = Gmaps4rails.build_markers(@users_6) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.json({ id: user.id })
    end
    # day 7

    # day 8
    who_cook(7)
    @markers_7 = Gmaps4rails.build_markers(@users_7) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.json({ id: user.id })
    end
    # day 8

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
