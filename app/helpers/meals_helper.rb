module MealsHelper

  def available_portions(meal)
    meal.portion - booked_portions(meal)
  end

  def booked_portions(meal)
    meal.orders.sum(:portion)
  end

end
