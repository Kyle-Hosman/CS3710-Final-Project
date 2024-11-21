FactoryBot.define do
  factory :item do
    association :user
    name { "Test Item" }
    description { "This is a test item." }
    price { 9.99 }
    availability { true }
  end
end
