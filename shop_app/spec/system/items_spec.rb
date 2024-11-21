require 'rails_helper'

RSpec.describe "Items", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    # Log in the user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  it 'allows an item to be created' do
    visit new_item_path
    fill_in 'Name', with: 'Test Item'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Price', with: '9.99'
    check 'Availability'
    click_on 'Create Item'
    expect(page).to have_content('Item was successfully created.')
  end
end
