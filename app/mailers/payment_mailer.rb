class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.confirmation.subject
  #
  def confirmation(order)
    @order = order
    # attachments.inline['pepeat-title.png'] = File.read('app/assets/images/pepeat-title.png')
    mail(to: @order.user.email, subject: 'Récapitulatif de votre commande')
  end

  def remember(order_id)
    @order = Order.find(params[:id])
    mail(to: @order.user.email, subject: "N'oubliez pas d'aller chercher votre commande")
  end
end
