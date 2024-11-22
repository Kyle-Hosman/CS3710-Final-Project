require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attributes) { { user_name: "Test User", email: "test@example.com", password: "password", password_confirmation: "password" } }

  describe "POST /users" do
    it "creates a new User" do
      expect {
        post users_path, params: { user: valid_attributes }
      }.to change(User, :count).by(1)
    end
  end

  describe "GET /users/:id" do
    let(:user) { User.create!(valid_attributes) }

    it "retrieves the requested user" do
      get user_path(user)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Test User")
      expect(response.body).to include("test@example.com")
    end
  end

  describe "PUT /users/:id" do
    let(:user) { User.create!(valid_attributes) }
    let(:new_attributes) { { user_name: "New User Name", email: "new@example.com", password: "newpassword", password_confirmation: "newpassword" } }

    it "updates the requested user" do
      put user_path(user), params: { user: new_attributes }
      user.reload
      expect(user.user_name).to eq("New User Name")
      expect(user.email).to eq("new@example.com")
    end
  end

  describe "DELETE /users/:id" do
    let(:user) { User.create!(valid_attributes) }

    it "destroys the requested user" do
      delete user_path(user)
      follow_redirect! # Follow the redirection
      expect(User.exists?(user.id)).to be_falsey
    end
  end
end
