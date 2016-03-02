
module Profile

  class PaymentsController < ApplicationController
    before_action :set_order
    before_action :filled_profile?

    def filled_profile?
      if current_user.picture && current_user.firstname && current_user.lastname && current_user.phone_number
        true
      else
        flash[:notice] = 'Vous devez remplir votre profil pour commander un plat'
        redirect_to edit_profile_path
      end
    end

    def new
      @client = 0.15
      @chief = 0.04
    end

    def create

    @client_amount = 1.15
    @client = 0.15
    @chief = 0.04

    @amount = @order.amount_cents * @order.portion.to_i * @client_amount

    if current_user.customer_id
      customer = Stripe::Customer.retrieve(current_user.customer_id)
    else

      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        card:  params[:stripeToken]
      )
      current_user.update(customer_id: customer.id)
    end

    # You should store this customer id and re-use it.
    @commission = @order.amount_cents * @order.portion.to_i * @client + @order.amount_cents * @order.portion.to_i * @chief
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount:       @amount.to_i,  # in cents
      description:  "#{@order.user.firstname} a commandé #{@order.portion} menus #{@order.meal.title} au cuisniner #{@order.meal.user.surname}",
      currency:     'eur',
      destination: @order.meal.user.stripe_id,
      capture: 'false',
      application_fee: @commission.to_i
    })
    @order.update(payment: charge.to_json, state: 'paid', charge: charge.id)
    current_user.update(number_orders: current_user.number_orders.to_i + 1, last_order: DateTime.now)
    @order.meal.user.update(number_meals_sold: @order.meal.user.number_meals_sold.to_i + @order.portion.to_i, ca: @order.meal.user.ca.to_i + @order.portion.to_i * (@order.amount_cents.to_i / 100 ))

    StripeJob.delay_until(@order.meal.day + 23.hour).perform_later(@order.id)
    PaymentMailer.delay_until(@order.meal.day + 41.hour).review(@order.id)
    PaymentMailer.confirmation(@order.id).deliver_later
    PaymentMailer.new_order(@order.id).deliver_later
    PaymentMailer.delay_until(@order.meal.day).remember(@order.id)

    redirect_to profile_orders_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_profile_order_payment_path(@order)
    end

  private

    def set_order
      @order = Order.where(state: 'pending').find(params[:order_id])
    end
  end
end
