class PurchaseHouseAdd

  include ActiveModel::Model
  attr_accessor  :postal_code, :shipping_origin_id, :city, :address, :building_name, :phone, :token, :item_id, :user_id

  with_options presence: true do

    validates :city, :address

    with_options format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフン(-)を含めてください"} do
      validates :postal_code
    end

    with_options numericality: { other_than: 1, message: "を入力してください" } do
      validates :shipping_origin_id
    end

    with_options format: {with: /\A[0-9]{,11}\z/, message: "を11桁以内かつハイフン(-)含めず入力してください"} do
      validates :phone
    end
  end

  def save
    purchase = Purchase.create( item_id: item_id, user_id: user_id)
    HouseAdd.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city: city, address: address, building_name: building_name, phone: phone, purchase_id: purchase.id)
  end
end 