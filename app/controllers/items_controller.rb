class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

end
