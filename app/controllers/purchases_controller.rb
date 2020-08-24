class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :back_to_root

  def index
    @item = Item.find(params[:item_id])
    @house_add = PurchaseHouseAdd.new
  end

  def create
    
    @item = Item.find(params[:item_id])
    @house_add = PurchaseHouseAdd.new(postal_code: house_add_params[:postal_code], shipping_origin_id: house_add_params[:shipping_origin_id], city: house_add_params[:city], address: house_add_params[:address], building_name: house_add_params[:building_name], phone: house_add_params[:phone], user_id: house_add_params[:user_id], item_id: house_add_params[:item_id] )

    if @house_add.valid?
      @item.buy = true
      pay_item
      @item.save
      @house_add.save
        return redirect_to item_path(@item.id)
    else
      render :index

    end
  end

  private


  def house_add_params
    params.require(:purchase_house_add).permit(:postal_code, :shipping_origin_id, :city, :address, :building_name, :phone, :token ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: house_add_params[:token],
      currency:'jpy'
    )
  end

  def back_to_root
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
    redirect_to root_path
    end
  end
end
