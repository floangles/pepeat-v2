
module Profile

  class PaymentsController < ApplicationController
    before_action :set_order

    def new
      @client = 0.15
      @chief = 0.04
    end

    def create

    @client_amount = 1.15
    @client = 0.15
    @chief = 0.04

    @amount = @order.amount_cents * @order.portion.to_i * @client_amount

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card:  params[:stripeToken]
    )
    # You should store this customer id and re-use it.
    @commission = @order.amount_cents * @order.portion.to_i * @client + @order.amount_cents * @order.portion.to_i * @chief
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount:       @amount.to_i,  # in cents
      description:  "#{@order.user.firstname} a commandé #{@order.portion} menus #{@order.meal.title} au cuisniner #{@order.meal.user.surname}",
      currency:     'eur',
      destination: @order.meal.user.uid,
      capture: 'false',
      application_fee: @commission.to_i
    })
    @order.update(payment: charge.to_json, state: 'paid', charge: charge.id)
    redirect_to profile_orders_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_payment_path(@order)
    end

  private

    def set_order
      @order = Order.where(state: 'pending').find(params[:order_id])
    end
  end
end
