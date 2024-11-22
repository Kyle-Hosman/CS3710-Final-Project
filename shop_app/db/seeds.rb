# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Create some users with Devise
users = User.create!([
  { user_name: Faker::Internet.username, email: Faker::Internet.email, password: 'password', password_confirmation: 'password' },
  { user_name: Faker::Internet.username, email: Faker::Internet.email, password: 'password', password_confirmation: 'password' }
])

# Create some items for each user
items = Item.create!([
  { name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: Faker::Commerce.price, availability: [true, false].sample, user: users.first },
  { name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: Faker::Commerce.price, availability: [true, false].sample, user: users.first },
  { name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: Faker::Commerce.price, availability: [true, false].sample, user: users.last },
  { name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: Faker::Commerce.price, availability: [true, false].sample, user: users.last }
])