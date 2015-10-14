class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    @order.update(payment: charge.to_json, state: 'paid')
    redirect_to order_path(@order)
  end

private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
