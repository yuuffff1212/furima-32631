FactoryBot.define do
  factory :user_customer do
    postal_code         {"157-0077"}
    city                {"東京"}
    house_number        {"1-1"}
    tell                {"08045454444"}
    shipping_region_id  {1}
    user_id             {1}
    item_id             {1}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
