class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.confirmation.subject
  #
  def confirmation(order_id)
    @order = Order.find(order_id)
    # attachments.inline['pepeat-title.png'] = File.read('app/assets/images/pepeat-title.png')
    mail(to: @order.user.email, subject: 'Récapitulatif de votre commande')
  end

  def remember(order_id)
    @order = Order.find(order_id)
    mail(to: @order.user.email, subject: " #{@order.user.firstname}, n'oublie pas d'aller chercher ta commande Pepeat")
  end


  def new_order(order_id)
    @order = Order.find(order_id)
    mail(to: @order.meal.user.email, subject: "Féliciation #{@order.meal.user.firstname}, tu as une commande")
  end

  def cancel_before(order_id)
    @order = Order.find(order_id)
    mail(to: @order.meal.user.email, subject: "#{@order.user.firstname} a annulé sa commande")
  end

  def cancel_before_user(order_id)
    @order = Order.find(order_id)
    mail(to: @order.user.email, subject: "#{@order.user.firstname}, ta commande est bien annulée")
  end

  def cancel_after(order_id)
    @order = Order.find(order_id)
    mail(to: @order.meal.user.email, subject: "#{@order.user.firstname} a annulé sa commande")
  end

  def cancel_after_user(order_id)
    @order = Order.find(order_id)
    mail(to: @order.user.email, subject: "#{@order.user.firstname}, ta commande est bien annulée")
  end

  def review(order_id)
    @order = Order.find(order_id)
    mail(to: @order.user.email, subject: "#{@order.user.firstname}, ton repas Pepeat d'hier s'est bien passé ? Donne ton avis sur le Pepeato #{@order.meal.user.firstname}.")
  end


end
