class PaymentMailerPreview < ActionMailer::Preview
  def confirmation
    order = Order.first
    PaymentMailer.confirmation(order)
  end
  def remember
    order = Order.first
    PaymentMailer.remember(order)
  end
end
