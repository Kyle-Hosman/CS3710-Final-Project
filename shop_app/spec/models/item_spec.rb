require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.build(:item) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(item).to be_valid
    end

    it 'is not valid without a price' do
      item.price = nil
      expect(item).to_not be_valid
    end
  end
end
