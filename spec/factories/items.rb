FactoryBot.define do
  factory :item do
    item {Faker::Name.initials(number: 5)}
    trait :image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/filrs/bird.png')) }
    end
    text {Faker::Lorem.sentence}
    category_id {1}
    status_id {1}
    delivery_burden_id {1}
    shipping_origin_id {1}
    arrival_day_id {1}
    price {1000}
    # association :user


  end
end

trait :image do
  image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.png')) }
end