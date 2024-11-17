require 'rails_helper'
RSpec.describe "Items", type: :request do

  # Test item creation (requires user)
  describe "POST /items" do
    let(:user) { User.create!(user_name: "Test User", email: "test@example.com") }
    let(:valid_attributes) { { name: "Item", description:"an item description", price: 1.99, availability: true } }
    
    it "creates a new Item" do
      expect {
        post user_items_path(user), params: { item: valid_attributes }
      }.to change(Item, :count).by(1)
    end
  end

  # Test item read
  describe "GET /users/:user_id/items/:id" do
    let(:user) { User.create!(user_name: "Test User", email: "test@example.com") }
    let(:item) { user.items.create!(name: "Item", description: "an item description", price: 1.99, availability: true) }

    it "retrieves the requested item" do
      get user_item_path(user, item)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Item")
      expect(response.body).to include("an item description")
    end
  end

  # Test item update
  describe "PUT /users/:user_id/items/:id" do
    let(:user) { User.create!(user_name: "Test User", email: "test@example.com") }
    let(:item) { user.items.create!(name: "Item", description: "an item description", price: 1.99, availability: true) }
    let(:new_attributes) { { name: "New Item Name" } }

    it "updates the requested item" do
      put user_item_path(user, item), params: { item: new_attributes }
      item.reload
      expect(item.name).to eq("New Item Name")
    end
  end

  # Test item deletion
  describe "DELETE /users/:user_id/items/:id" do
    let(:user) { User.create!(user_name: "Test User", email: "test@example.com") }
    let(:item) { user.items.create!(name: "Item", description: "an item description", price: 1.99, availability: true) }

    it "destroys the requested item" do
      delete user_item_path(user, item)
      follow_redirect! # Follow the redirection
      expect(Item.exists?(item.id)).to be_falsey
    end
  end

end