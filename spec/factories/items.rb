FactoryBot.define do
  factory :item do
    name {"商品"}
    text {"商品の説明"}
    price {300}
    shipping_region_id {1}
    shipping_date_id {1}
    shipping_cost_id {1}
    item_category_id {1}
    item_state_id {1}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
