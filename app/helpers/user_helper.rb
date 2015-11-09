module UserHelper

  def user_rating(user)
    array= []
    user.meals.each do |meal|
      array << meal.orders.count(:review)
    end

    array.sum
  end

  def age(user)
    if user.birth
      DateTime.now.year - user.birth.year
    end
  end


end
