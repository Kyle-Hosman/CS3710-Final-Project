require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  context 'Should validate' do
    it 'validates with valid attributes' do
      expect(user).to be_valid
    end
  end

  context 'Should not validate' do
    it "is not valid without a password" do
      user.password = nil
      expect(user).to_not be_valid
    end
  end

end
