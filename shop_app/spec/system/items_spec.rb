require 'rails_helper'

RSpec.describe "Items", type: :system do
  it 'allows an item to be created' do
    visit new_item_path
    fill_in 'Name', with: 'Test Item'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Price', with: '9.99'
    click_on 'Create Item'
    expect(page).to have_content('Item was successfully created.')
  end
end
