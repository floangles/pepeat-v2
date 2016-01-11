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

  def validation(meal_id)
    @meal = Meal.find(meal_id)
    mail(to: @meal.user.email, subject: "Félicitation #{@meal.user.firstname}, ton menu '#{@meal.title}' est créé")
  end


  def cancel(meal_id)
    @meal = Meal.find(meal_id)
    @meal.orders.each do |order|
      mail(to: order.user.email, subject: "#{order.user.firstname}, votre repas Pepeat du #{l(order.meal.day, format: '%A %d')} est annulé ")
    end
  end
end

