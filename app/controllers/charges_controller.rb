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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
