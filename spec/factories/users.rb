FactoryBot.define do
  Faker::Config.locale = :ja
  factory :user do
    nickname        {Faker::Name.last_name}
    first_name      {Faker::Name.first_name}
    last_name       {Faker::Name.last_name}
    first_name_kana {"ハナコ"}
    last_name_kana  {"ヤマダ"}
    email           {Faker::Internet.free_email}
    password        {"1m1m1m"}
    password_confirmation {password}
    birth_date      {"1985-06-28"}
  end
end