
module Profile
  class OrdersController < ApplicationController

    before_action :authenticate_user!
    before_action :set_order, only: [:show, :update, :destroy]


    def index
      @orders = policy_scope(Order)
      @orders = current_user.orders.all
      @markers = Gmaps4rails.build_markers(@orders) do |order, marker|
        marker.lat order.meal.user.latitude
        marker.lng order.meal.user.longitude
      end
    end


    def new
      @meal = Meal.find(params[:order][:meal_id])
      @order = Order.new
      authorize @order
    end

    def create
      @meal = Meal.find(params[:order][:meal_id])
      @order = @meal.orders.build(order_params)
      authorize @order
      @order.user = current_user

      if @order.save
        redirect_to profile_orders_path
      else
        render :new
      end
    end

    def show
      authorize @order
    end

    def edit
       authorize @order
    end

    def update
      authorize @order
      if params[:order][:review] != nil
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to profile_orders_path
      end
    end

    def destroy
      @order.destroy
      redirect_to profile_orders_path
    end

    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:portion, :meal_id, :review)
    end
  end
end
