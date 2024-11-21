FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
  end
end
