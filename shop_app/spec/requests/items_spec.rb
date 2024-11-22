require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { { name: "Item", description: "an item description", price: 1.99, availability: true } }

  before do
    post user_session_path, params: { user: { email: user.email, password: user.password } }
  end

  describe "POST /items" do
    it "creates a new Item" do
      expect {
        post items_path, params: { item: valid_attributes }
      }.to change(Item, :count).by(1)
    end
  end

  describe "GET /items/:id" do
    let(:item) { user.items.create!(valid_attributes) }

    it "retrieves the requested item" do
      get item_path(item)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Item")
      expect(response.body).to include("an item description")
    end
  end

  describe "PUT /items/:id" do
    let(:item) { user.items.create!(valid_attributes) }
    let(:new_attributes) { { name: "New Item Name" } }

    it "updates the requested item" do
      put item_path(item), params: { item: new_attributes }
      item.reload
      expect(item.name).to eq("New Item Name")
    end
  end

  describe "DELETE /items/:id" do
    let!(:item) { user.items.create!(valid_attributes) }

    it "destroys the requested item" do
      expect {
        delete item_path(item)
      }.to change(Item, :count).by(-1)
    end
  end
end