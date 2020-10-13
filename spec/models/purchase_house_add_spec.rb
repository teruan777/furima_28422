require 'rails_helper'

RSpec.describe PurchaseHouseAdd, type: :model do
  describe '購入' do
    before do
      @purchase = FactoryBot.build(:purchase_house_add)
    end
    context '購入できるとき' do
      it '全ての項目が入っていてかつ郵便番号にはハイフンが入っていて（123-4567）のような形になっていることかつ電話番号が数字のみの11桁以内であった場合購入できる' do
        expect(@purchase).to be_valid
      end
      it '建物名が存在してなくても他の全ての項目が正しく入力されていれば購入できる' do
      @purchase.building_name = nil
      expect(@purchase).to be_valid
      end
    end
    context '購入できないとき' do
      it '郵便番号が空では購入できない' do
        @purchase.postal_code = nil
        expect(@purchase).to_not be_valid
      end
      it '郵便番号でハイフンが使われていなければ購入できない' do
        @purchase.postal_code = '0001111'
        expect(@purchase).to_not be_valid
      end
      it '郵便番号で正しく入力されていなければ購入できない' do
        @purchase.postal_code = '0000-000'
        expect(@purchase).to_not be_valid
      end
      it '都道府県が(--)では購入できない' do
        @purchase.shipping_origin_id = nil
        expect(@purchase).to_not be_valid
      end
      it '市区町村が空では購入できない' do
        @purchase.city = nil
        expect(@purchase).to_not be_valid
      end
      it '番地が空では購入できない' do
        @purchase.address = nil
        expect(@purchase).to_not be_valid
      end
      it '電話番号が空では購入できない' do
        @purchase.phone = nil
        expect(@purchase).to_not be_valid
      end
      it '電話番号でハイフンが使われていた場合購入できない' do
        @purchase.phone = '090-1234-5678'
        expect(@purchase).to_not be_valid
      end
      it '電話番号が11桁より多かった場合購入できない' do
        @purchase.phone = '090123456789'
        expect(@purchase).to_not be_valid
      end
    end
  end
end
