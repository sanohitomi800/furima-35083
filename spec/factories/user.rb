FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { "0a" + Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    last_name             { "山田" }            
    fast_name             { "陸太郎" }
    last_name_kana        { "ヤマダ" }
    fast_name_kana        { "リクタロウ" }
    birthday              { "2021-01-01" }
  
  
  end
end