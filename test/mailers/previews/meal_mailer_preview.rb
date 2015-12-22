class MealMailerPreview < ActionMailer::Preview
  def creation
    meal = Meal.first
    MealMailer.creation(meal.id)
  end

  def validation
    meal = Meal.first
    MealMailer.validation(meal.id)
  end
end
