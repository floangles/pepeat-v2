class PaymentMailerPreview < ActionMailer::Preview
  def confirmation
    order = Order.first
    PaymentMailer.confirmation(order)
  end
end
