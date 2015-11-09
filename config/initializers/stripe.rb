
if(Rails.env == 'development' || Rails.env == 'staging')
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_AnTNRrYA5hnK0DRMzVqIOMUw',
    secret_key:      'sk_test_E09VifanTXsnC6sNtJRxKpjk',
    client_id:  'ca_7ATbm44iBE4AsxcmbWjU3Bk4FiXZbOzB'
  }

  Stripe.api_key = 'sk_test_E09VifanTXsnC6sNtJRxKpjk'

elsif(Rails.env == 'production')
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key:      ENV['STRIPE_SECRET_KEY']
    client_id:  ENV['STRIPE_CONNECT_CIENT_ID']
  }

  Stripe.api_key = ENV['STRIPE_SECRET_KEY']

end
