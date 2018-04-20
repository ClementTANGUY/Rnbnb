Rails.configuration.stripe = {
  :publishable_key => 'pk_test_zibhEMecdX0AATaUCmCnN6c7',
 
  :secret_key      => 'sk_test_aEmEgGX8QgOdRzX0PSrn11js'
 
}
 
Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Set your secret key: remember to change this to your live secret key in production
# See your keys here: https://dashboard.stripe.com/account/apikeys
Stripe.api_key = "sk_test_aEmEgGX8QgOdRzX0PSrn11js"

# Token is created using Checkout or Elements!
# Get the payment token ID submitted by the form:
token = params[:stripeToken]

charge = Stripe::Charge.create({
    amount: 999,
    currency: 'eur',
    description: 'rnbnb',
    source: token,
})