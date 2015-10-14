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

  def total_recettes(meals)
    array = []
    meals.each do |meal|
      meal.orders.each do |order|
        array << order.meal.price.to_i * order.portion
      end
    end

    array.sum
  end

  def total_meal_sold(meals)
    array = []
    current_user.meals.each do |meal|
      array << meal.orders.sum(:portion)
    end
    array.sum
  end


  def notification(meals)

  end


end
