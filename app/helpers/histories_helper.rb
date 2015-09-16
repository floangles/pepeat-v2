module HistoriesHelper

  def totalprice(order)
    unity = order.meal.price
    portion = order.portion

    unity * portion
  end

end
