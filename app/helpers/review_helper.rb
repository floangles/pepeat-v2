module ReviewHelper

  def review(user)
    res = 0
    user.meals.each do |meal|
      if meal.orders.count(:review) != 0
        res += 1
      end
    end
    res
  end

end
