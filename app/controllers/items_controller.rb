class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :set_item_up_under, only: [:show]
  before_action :set_keep, only: [:show]
  before_action :search_item, only: [:shadow_search, :search]
  before_action :back_to_edit, only: [:edit]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :back_to_index, except: [:index, :show, :shadow_search, :search]

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
    # binding.pry
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    @item.destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def shadow_search
    @search = Item.all
  end

  def search
    @results = @p.result.where(buy: nil)
  end




  private

  def item_params
    params.require(:item).permit(:item, :image, :text, :category_id, :status_id, :delivery_burden_id, :shipping_origin_id, :arrival_day_id, :price).merge(user_id: current_user.id)
  end



  def back_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def search_item
    @p =Item.ransack(params[:q])
    @category = Category.where.not(id: 1)
    @status = Status.where.not(id: 1)
    @delivery_burden= DeliveryBurden.where.not(id: 1)
    @arrival_day= ArrivalDay.where.not(id: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_up_under
    @item_up_under = Item.find(params[:id])

    # under = @item.id - 1
    # first = Item.first
    # if first.id != under
    #   @item_under = Item.find(under)
    # else
    #   @item_under = Item.last
    # end
  end


  def back_to_edit
    redirect_to item_path(@item.id) unless @item.buy == nil
  end

  def set_keep
    if user_signed_in?
      @keeps = Keep.find_by(user_id: current_user.id, item_id: @item.id)
    end
  end


  
end
