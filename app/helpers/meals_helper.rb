module MealsHelper

  def available_portions(meal)
    meal.portion - booked_portions(meal)
  end

  def booked_portions(meal)
    meal.orders.sum(:portion)
  end

  def total_recette(meal)
    array = []
    meal.orders.each do |order|
      array << order.meal.price.to_i * order.portion
    end

    array.sum
  end

end
