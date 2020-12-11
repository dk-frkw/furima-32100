FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code { '123-4567' }
    delivery_area_id { 2 }
    municipality { "福岡県福岡市" }
    address { "福岡1-2-3" }
    building_name { "福岡ビル" }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id { 1 }
    item_id { 1 }
  end
end
