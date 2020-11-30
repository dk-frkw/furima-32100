FactoryBot.define do
  factory :item do
    name {"商品名"}
    explanation {"商品の説明"}
    category_id {2}
    condition_id {2}
    delivery_fee_id {2}
    delivery_area_id {2}
    delivery_days_id {2}
    price {3000}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
