class OrderMailer < ActionMailer::Base
  default :from => Setting.get('general.default_from_address', true)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.completed.subject
  #
  def completed(order)
    @order = order

    mail :to => order.billing_address.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.paid.subject
  #
  def paid(order)
    @order = order

    mail :to => order.billing_address.email
  end
end
