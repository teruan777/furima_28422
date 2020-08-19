class PurchasesController < ApplicationController

  def create
    @purchase = Purchase.new(#: purchase_params[:#])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to #_path
    else
      render '#'
    end
  end

  private
  def purchase_params
    prams.permit(:token)
  end

  def pay_item
    payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    payjp::Charge.create(
      amount: purchase_params[:#],
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
