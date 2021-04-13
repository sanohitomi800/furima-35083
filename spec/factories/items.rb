FactoryBot.define do
  factory :item do
    image        {'staff3.jpg'} 
    name         {Faker::Name.initials(number: 40)}
    info         {Faker::Lorem.sentence}        
    category_id     { 2 }
    status_id       { 2 }
    shipping_fee_id { 2 }
    prefecture_id   { 2 }
    day_id          { 2 } 
    price        { 1_000 }
    association :user 
 
    after(:build) do |item|
    item.image.attach(io: File.open('public/staff3.jpg'), filename: 'staff3.jpg')
    end
  end
end
