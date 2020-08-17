class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :back_to_index, except: [:index]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :image, :text, :category_id, :status_id, :delivery_burden_id, :shipping_origin_id, :arrival_day_id, :price)
  end

  def back_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
