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
        I18n.with_locale(:ja) do
          @item.valid?
        end
        expect(@item.errors[:item]).to include("を入力してください")
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        expect(@item).to_not be_valid
      end
      it 'textが空だと出品できない' do
        @item.text = nil
        expect(@item).to_not be_valid
      end
      it 'category_idが -- だと出品できない' do
        @item.category_id = 1
        expect(@item).to_not be_valid
      end
      it 'status_idが -- だと出品できない' do
        @item.status_id = 1
        expect(@item).to_not be_valid
      end
      it 'delivery_burden_idが -- だと出品できない' do
        @item.delivery_burden_id = 1
        expect(@item).to_not be_valid
      end
      it 'shipping_origin_idが -- だと出品できない' do
        @item.shipping_origin_id = 1
        expect(@item).to_not be_valid
      end
      it 'arrival_day_idが -- だと出品できない' do
        @item.arrival_day_id = 1
        expect(@item).to_not be_valid
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        expect(@item).to_not be_valid
      end
      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        expect(@item).to_not be_valid
      end
      it 'priceが9999999円以上だと出品できない' do
        @item.price = 10_000_000
        expect(@item).to_not be_valid
      end
    end
  end
end
