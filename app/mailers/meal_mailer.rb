class MealMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.meal_mailer.creation.subject
  #
  def creation(meal_id)
    @meal = Meal.find(meal_id)
    mail(to: 'team@pepeat.org', subject: 'Nouveau menu proposé')
  end
end
