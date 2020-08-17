FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"aaaa1111"}
    password_confirmation {password}
    familyname_kanji {"沢庵"}
    firstname_kanji {"侍"}
    familyname_katakana {"タクアン"}
    firstname_katakana {"サムライ"}
    birthday {"1940-01-01"}
  end
end
