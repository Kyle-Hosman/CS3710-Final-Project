FactoryBot.define do
    factory(:user) do
        user_name { Faker::Name.name }
        password { Faker::Internet.password }
    end
end