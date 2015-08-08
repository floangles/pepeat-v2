
module Profile
  class OrdersController < ApplicationController

    before_action :authenticate_user!
    before_action :set_order, only: [:show, :update, :destroy]


    def index
      @orders = current_user.orders.all
    end

    def show

    end

    def new
      @meal = Meal.find(params[:order][:meal_id])
      @order = Order.new
    end

    def create
      @meal = Meal.find(params[:order][:meal_id])
      @order = @meal.orders.build(order_params)

      if @order.save
        redirect_to profile_orders_path
      else
        render :new
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:portion, :meal_id)
    end
  end
end
