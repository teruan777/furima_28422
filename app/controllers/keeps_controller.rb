class KeepsController < ApplicationController
  before_action :back_to_root, only: [:index, :create, :destroy]
  
  def index
    @keeps = Keep.where(user_id: current_user.id)
  end
  
  def create
    keep = current_user.keeps.build(item_id: params[:item_id])
    keep.save!
    redirect_to item_path(params[:item_id])
  end

  def destroy
    current_user.keeps.find_by(item_id: params[:item_id]).destroy!
    redirect_to item_path(params[:item_id])
  end

  private

  def back_to_root
    redirect_to root_path unless user_signed_in?
  end
  
end
