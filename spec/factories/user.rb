FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"林"}
    first_name {"太郎"}
    last_name_kana {"ハヤシ"}
    first_name_kana {"タロウ"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end