if Rails.env == 'development'
  ActiveMerchant::Billing::Base.mode = :test
  paypal_options = {
    :login => "maciej+seller_api1.galdomedia.pl",
    :password => "N4NQ8V3V2D4SCT8N",
    :signature => "AuOP9GqI-vLwQhNS1-YlfPxkOyipAVWeC6ww-txHpyhMkW5cHe.vYeA1"
  }
  ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
elsif Rails.env == 'test'
  ActiveMerchant::Billing::Base.mode = :test
  ::STANDARD_GATEWAY = ActiveMerchant::Billing::BogusGateway.new
  ::EXPRESS_GATEWAY = ActiveMerchant::Billing::BogusGateway.new
else
  ActiveMerchant::Billing::Base.mode = :test
  paypal_options = {
    :login => "maciej+seller_api1.galdomedia.pl",
    :password => "N4NQ8V3V2D4SCT8N",
    :signature => "AuOP9GqI-vLwQhNS1-YlfPxkOyipAVWeC6ww-txHpyhMkW5cHe.vYeA1"
  }
  ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
end