class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.confirmation.subject
  #
  def confirmation(order)
    @order = order
    # attachments.inline['pepeat-title.png'] = File.read('app/assets/images/pepeat-title.png')
    mail(to: @order.user.email, subject: 'Recapitulatif de votre commande')
  end
end
