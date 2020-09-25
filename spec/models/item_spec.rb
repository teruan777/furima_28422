require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item, :with_image)
    end
    context '商品出品できる時' do
      it '全ての項目が入っていてかつpriceが300円以上、9999999円以下であれば商品出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it 'itemが空だと出品できない' do
        @item.item = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の名前を入力してください')
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'textが空だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが -- だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category は ” -- ” 以外を選択してください')
      end
      it 'status_idが -- だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status は ” -- ” 以外を選択してください')
      end
      it 'delivery_burden_idが -- だと出品できない' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden は ” -- ” 以外を選択してください')
      end
      it 'shipping_origin_idが -- だと出品できない' do
        @item.shipping_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping origin は ” -- ” 以外を選択してください')
      end
      it 'arrival_day_idが -- だと出品できない' do
        @item.arrival_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Arrival day は ” -- ” 以外を選択してください')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
