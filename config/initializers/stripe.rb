Rails.configuration.stripe = {
  :publishable_key => 'pk_test_zibhEMecdX0AATaUCmCnN6c7',
 
  :secret_key      => 'sk_test_aEmEgGX8QgOdRzX0PSrn11js'
 
}
 
Stripe.api_key = Rails.configuration.stripe[:secret_key]