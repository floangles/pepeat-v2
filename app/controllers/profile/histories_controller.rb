
module Profile
  class HistoriesController < ApplicationController

    before_action :authenticate_user!

    def index


      @users = User.all
      @orders = policy_scope(Order)
      @orders = current_user.orders.all
      @markers = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
      end
    end

    def show
      @order = Order.find(params[:id])
      authorize @order
    end

    def edit
      @order = Order.find(params[:id])
      authorize @order
    end

    def update
      if params[:order][:review] != nil
        @order = Order.find(params[:id])
        authorize @order
        @order.update(history_params)
        redirect_to profile_orders_path
      end
    end

    def history_params
      params.require(:order).permit(:review)
    end

  end
end
