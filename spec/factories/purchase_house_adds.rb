FactoryBot.define do
  factory :purchase_house_add do
      postal_code        {'000-0000'}
      shipping_origin_id { 2 }
      city               {'沢庵市'}
      address            {'1-1-1'}
      building_name      {'ライオンズマンション'}
      phone              {'09012345678'}
      user_id            { 1 }
      item_id            { 4 }
  end
end
