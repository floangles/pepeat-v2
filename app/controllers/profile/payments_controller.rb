
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

    PaymentMailer.confirmation(@order.id).deliver_later
    PaymentMailer.delay_for(1.hour).remember(@order.id)

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
    Analytics.track(
      user_id: current_user.id,
      event: 'Purchased menu',
      properties: { price: @amount / 100, menu: @order.meal.title, portion: @order.portion, charge: charge.id }
    )

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
