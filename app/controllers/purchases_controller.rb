class PurchasesController < ApplicationController

  def create
    @purchase = Purchase.new(#: purchase_params[:#])
    if @purchase.valid?
      @item = Item.find(params[:item_id])
      pay_item
      @purchase.save
      return redirect_to item_path(@item.id)
    else
      render '#'
    end
  end

  private
  def purchase_params
    prams.permit(:token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
