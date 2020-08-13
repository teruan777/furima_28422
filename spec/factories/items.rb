FactoryBot.define do
  factry :item do
    item {Faker::Name.initials(number: 5)}
    image {Faker::Lorem.sentense}
    text {Faker::Lorem.sentense}
    category_id {1}
    status_id {1}
    delivery_burden_id {1}
    shipping_origin_id {1}
    arrivel_day_id {1}
    price {1000}
    association :user
  end
end