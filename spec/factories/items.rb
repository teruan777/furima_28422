FactoryBot.define do
  factory :item do
    item { '沢庵侍' }
    trait :with_image do
      image { fixture_file_upload Rails.root.join('spec', 'files', 'テスト用画像.jpg'), 'image/jpg' }
    end
    text { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    delivery_burden_id { 2 }
    shipping_origin_id { 2 }
    arrival_day_id { 2 }
    price { 1000 }
    # association :user
  end
end
