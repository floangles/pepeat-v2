
module Profile
  class OrdersController < ApplicationController

    before_action :authenticate_user!
    before_action :set_order, only: [:show, :update, :destroy, :charged]


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
        redirect_to new_profile_order_payment_path(@order)
      else
        render :new
      end
    end

    def show
      authorize @order
      ch = Stripe::Charge.retrieve(@order.charge)
      if !ch.captured
        ch.capture
      end
    end

    def edit
       authorize @order
    end

    def destroy
      @order.destroy
      redirect_to profile_orders_path
    end

    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def history
      @orders = policy_scope(Order)
      @orders = current_user.orders.all
      @markers = Gmaps4rails.build_markers(@orders) do |order, marker|
        marker.lat order.meal.user.latitude
        marker.lng order.meal.user.longitude
      end
    end

    def rating
      @order = Order.find(params[:id])
    end

    def update
      if params[:order][:review] != nil
        @order = Order.find(params[:id])
        authorize @order
        @order.update(review_params)
        redirect_to profile_orders_path
      end
    end

    def order_params
      params.require(:order).permit(:portion, :meal_id, :amount, :state )
    end

    def review_params
      params.require(:order).permit(:review)
    end

  end
end
