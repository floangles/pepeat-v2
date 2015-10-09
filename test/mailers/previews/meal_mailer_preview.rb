class MealMailerPreview < ActionMailer::Preview
  def creation
    meal = Meal.first
    MealMailer.creation(meal)
  end
end
