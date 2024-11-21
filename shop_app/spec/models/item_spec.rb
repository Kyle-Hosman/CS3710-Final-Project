require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.build(:item) }

  context 'Should validate' do
    it 'validates with valid attributes' do
      expect(item).to be_valid
    end
  end
  
  context 'Should not validate' do
    it "is not valid without a price" do
      item.price = nil
      expect(item).to_not be_valid
    end
  end

end
