FactoryBot.define do
  factory :user do
    user_name { "Test User" }
    email { "test@example.com" }
    password { "password" }
  end
end

