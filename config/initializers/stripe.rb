
if(Rails.env == 'development' || Rails.env == 'staging')
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_AnTNRrYA5hnK0DRMzVqIOMUw',
    secret_key:      'sk_test_E09VifanTXsnC6sNtJRxKpjk',
    connect_client_id:  'ca_7ATbm44iBE4AsxcmbWjU3Bk4FiXZbOzB'
  }

  Stripe.api_key = 'sk_test_E09VifanTXsnC6sNtJRxKpjk'

elsif(Rails.env == 'production')
  Rails.configuration.stripe = {
    publishable_key: 'pk_live_6tGB61xC0159X3pk3kCQnyH2',
    secret_key:      'sk_live_3nqS8jWNXEeInQ1UtjA9K4GN',
    connect_client_id:  'ca_7ATb1JCa4Sr4pPPPGhuTJoTcy5RxWR8Q'
  }

  Stripe.api_key = 'sk_test_E09VifanTXsnC6sNtJRxKpjk'

end
