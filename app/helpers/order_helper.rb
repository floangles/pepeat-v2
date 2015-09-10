module OrderHelper

  def average_rating(meal)
    ratings = []
    meal.orders.each do |order|
      ratings << order
    end
  ratings.count
  end

end



