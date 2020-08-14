FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 8)}
    password_confirmation {password}
    familyname_kanji {"沢庵"}
    firstname_kanji {"侍"}
    familyname_katakana {"タクアン"}
    firstname_katakana {"サムライ"}
    birthday {}
  end
end
