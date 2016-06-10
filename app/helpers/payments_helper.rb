module PaymentsHelper

  def price(order)
    order.amount * order.portion.to_i
  end

  def commission(order)
    order.amount * order.portion.to_i * @client
  end

  def total(order)
    price(order) + commission(order)
  end

  def total_cents(order)
    order.amount_cents * order.portion.to_i + order.amount_cents * order.portion.to_i * @client
  end
end
