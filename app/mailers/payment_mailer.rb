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
end
