module MealsHelper

  def available_portions(meal)
    meal.portion - booked_portions(meal)
  end

  def booked_portions(meal)
    array= []
    meal.orders.each do |order|
      if order.state == 'paid'
        array << order.portion
      end
    end
    array.sum
  end


  def total_meals(meals)
    array = []
    meals.each do |meal|
      if meal.validation? && meal_actual(meal)
        array << 1
      end
    end
    array.count
  end

  def number_meals(meals, x)
    array = []
    meals.each do |meal|
      if meal.validation? && meal_actual(meal)
        if (DateTime.now + x.days).day == meal.day.day
          array << 1
        end
      end
    end
     array.count
  end


  def meal_actual(meal)
    if meal.day > DateTime.now.to_date - 1.days
      true
    end
  end

  def meal_history(meal)
    if DateTime.now.to_date > meal.day
      true
    end
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
      meal.orders.where(state: "paid").each do |order|
        array << order.meal.price.to_i * order.portion - order.meal.price.to_i * order.portion * @chief
      end
    end

    array.sum.round
  end

  def total_meal_sold(meals)
    array = []
    current_user.meals.each do |meal|
      array << meal.orders.where(state: "paid").sum(:portion)
    end
    array.sum
  end


  def notification(meals)

  end



end
