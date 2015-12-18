class PaymentMailerPreview < ActionMailer::Preview
  def confirmation
    order = Order.first
    PaymentMailer.confirmation(order.id)
  end
  def remember
    order = Order.first
    PaymentMailer.remember(order.id)
  end
end
