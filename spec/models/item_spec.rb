require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    befor do
      @item = FactoryBot.build(:item)
    end
    context '商品出品できる時' do
      it "全ての項目が入っていてかつpriceが300円以上、9999999円以下であれば商品出品できる" do
        
      end
    end
    context '商品出品できない時' do
      it "itemが空だと出品できない" do
      
      end
      it "imageが空だと出品できない" do
      
      end
      it "textが空だと出品できない" do

      end
      it "category_idが -- だと出品できない" do

      end
      it "status_idが -- だと出品できない" do

      end
      it "delivery_burden_idが -- だと出品できない" do

      end
      it "shipping_origin_idが -- だと出品できない" do

      end
      it "arrival_day_idが -- だと出品できない" do

      end
      it "priceが空だと出品できない" do

      end
      it "priceが300円以下だと出品できない" do

      end
      it "priceが9999999以上だとだと出品できない" do

      end
    end
  end
end
