class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :authenticate_user!, only: [:new]
  before_action :back_to_index, except: [:index, :show]

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

  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  

  private

  def item_params
    params.require(:item).permit(:item, :image, :text, :category_id, :status_id, :delivery_burden_id, :shipping_origin_id, :arrival_day_id, :price).merge(user_id: current_user.id)
  end

  def back_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @items = Item.find(params[:id])
  end
end