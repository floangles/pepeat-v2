class StripeJob < ActiveJob::Base
  queue_as :default

  def perform(order_id)
    @order = Order.find(order_id)
      ch = Stripe::Charge.retrieve(@order.charge)
      if !ch.captured
        ch.capture
        @order.update(payment_validation: 'true')
      end
  end
end
