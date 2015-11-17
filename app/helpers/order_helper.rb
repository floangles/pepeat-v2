module OrderHelper

  def average_rating(meal)
    ratings = []
    meal.orders.each do |order|
      ratings << order
    end
  ratings.count
  end


  def average_rating_stars(meal)

    rating_stars = []
    meal.user.orders.each do |order|
      order.rates.each do |rate|
        rating_stars << rate.stars
      end
    end

  rating_stars.inject{ |sum, el| sum + el }.to_f / rating_stars.size
  end

  def order_history(order)
    if DateTime.now.to_date > order.meal.day
      true
    end
  end


  def order_price(order)
    order.meal.price * order.portion
  end

  def total_orders(orders)
    orders.count
  end

  def total_orders(meal)
    meal.orders.where(state: "paid").sum(:portion)
  end
end



