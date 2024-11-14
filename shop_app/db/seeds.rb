# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create some users
users = User.create!([
  { user_name: "john_doe", email: "john@example.com" },
  { user_name: "jane_doe", email: "jane@example.com" }
])

# Create some items for each user
items = Item.create!([
  { name: "Item 1", description: "Description for item 1", price: 10.0, availability: true, user: users.first },
  { name: "Item 2", description: "Description for item 2", price: 20.0, availability: false, user: users.first },
  { name: "Item 3", description: "Description for item 3", price: 30.0, availability: true, user: users.last },
  { name: "Item 4", description: "Description for item 4", price: 40.0, availability: false, user: users.last }
])