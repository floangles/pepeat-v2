class PaymentMailerPreview < ActionMailer::Preview
  def confirmation
    order = Order.first
    PaymentMailer.confirmation(order.id)
  end
  def remember
    order = Order.first
    PaymentMailer.remember(order.id)
  end

  def new_order
    order = Order.first
    PaymentMailer.new_order(order.id)
  end

  def cancel_after
    order = Order.first
    PaymentMailer.cancel_after(order.id)
  end

  def cancel_after_user
    order = Order.first
    PaymentMailer.cancel_after_user(order.id)
  end

  def cancel_before
    order = Order.first
    PaymentMailer.cancel_before(order.id)
  end

  def cancel_before_user
    order = Order.first
    PaymentMailer.cancel_before_user(order.id)
  end

  def review
    order = Order.first
    PaymentMailer.review(order.id)
  end
end
