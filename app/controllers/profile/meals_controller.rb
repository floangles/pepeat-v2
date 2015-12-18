module Profile
  class MealsController < ApplicationController

    before_action :authenticate_user!
    before_action :is_chief?
    before_action :set_meal, only: [:is_ordered, :show, :edit, :update, :destroy]
    before_action :has_stripe?, only: [:new]
    before_action :is_ordered?, only: [:edit, :update]


    def is_chief?
      if current_user.chief?
        true
      else
        render :text =>" Ce n'est pas bien de taper des URL au pif. Si vous voulez cuisiner postulez en tant que chef Pepeat"
      end
    end


    def is_ordered?
      if @meal.orders.where(state: "paid").sum(:portion)
        true
      else
        render :text =>" Ce n'est pas bien de taper des URL au pif.Vous ne pouvez supprimer un plat avec des commandes"
      end
    end

    def has_stripe?
      if current_user.stripe_id
        true
      else
        redirect_to profile_path, notice: "Vous devez entrer vos données bancaire avant de créer un menu."
      end
    end

    def validation
      @order = Order.find(params[:format])
      ch = Stripe::Charge.retrieve(@order.charge)
      if !ch.captured
        ch.capture
        @order.update(payment_validation: 'true')
        redirect_to profile_meals_path
      else
        redirect_to profile_meals_path
      end
    end

    def index
      @user = current_user
      @meals = policy_scope(Meal)
      @meals = current_user.meals
    end

    def show
    end

    def new
      @user = current_user
      @meal = Meal.new
      authorize @meal
    end

    def create

      @meal = current_user.meals.new(meal_params)
      authorize @meal
      if @meal.save
        MealMailer.creation(@meal.id).deliver_later

        if params[:pictures]
          params[:pictures].each { |picture|
            @meal.meal_pictures.create(picture: picture)
          }
        end
         redirect_to mealpic_profile_meals_path(meal_id: @meal.id)
      else
        render :new
      end
    end

    def edit
      @user = current_user
      authorize @meal
    end

    def update
      authorize @meal
      @meal.update(meal_params)
      if @meal.save
        if params[:pictures]
          params[:pictures].each {|picture|
          @meal.meal_pictures.create(picture: picture )
          }
        end
        redirect_to profile_meals_path
      else
        render :edit
      end
    end

    def mealpic
      @meal_picture = MealPicture.new
      @meal = current_user.meals.find(params[:meal_id])
    end

    def mealcrop
      @meal = current_user.meals.find(params[:meal_id])
      @picture = @meal.meal_pictures.find(params[:format])
    end

    def destroy
      authorize @meal
      @meal.destroy
      redirect_to profile_meals_path
    end

    def set_meal
      @meal = current_user.meals.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:cgu, :ingredients, :validation, :home_hour, :home, :starter, :main, :dessert, :price, :title, :portion, :description, :start_hour, :end_hour, :day, :picture, :takeaway)
    end

    def history
      @meals = policy_scope(Meal)
      @meals = current_user.meals
    end

  end
end
