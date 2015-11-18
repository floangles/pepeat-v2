class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.confirmation.subject
  #
  def confirmation(order)
    @order = order
    mail(to: @order.user.email, subject: 'Recapitulatif de votre commande')
  end
end
