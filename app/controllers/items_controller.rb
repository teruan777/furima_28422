class ItemsController < ApplicationController
  before_action :authenticate_user!, only: []


  def index
    @items = Item.all.order("created_at DESC")
  end

end
