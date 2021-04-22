FactoryBot.define do
  factory :purchase_address do
    postalcoad { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    apartment {"柳ビル"}
    phon_number {19012345678}
    token {"tok_abcdefghijk00000000000000000"}
  end
end