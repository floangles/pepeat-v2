module UserHelper

  def user_rating(user)
    array= []
    user.meals.each do |meal|
      array << meal.orders.count(:review)
    end

    array.sum
  end

end
