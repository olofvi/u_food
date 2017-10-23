class ChargesController < ApplicationController
  def create
    @cart = Cart.find(params[:cart_id])
    @amount = (@cart.total * 100).to_i

    customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Best Slow Food order',
        currency: 'sek'
    )
    # TODO: Mark cart as payed
    # TODO: Clear session from cart_id
    # TODO: Render the thank you page (create.html.haml)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    # TODO: This error should redirect back to cart page
    redirect_to new_charge_path

    #TODO: Handle other errors that might occur (no funds, etc..)
  end

end
