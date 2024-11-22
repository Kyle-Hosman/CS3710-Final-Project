require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe "Items", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    driven_by(:selenium, using: :headless_chrome)
    Capybara.register_driver :headless_chrome do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      options.add_argument('--disable-gpu')
      options.add_argument('--no-sandbox')
      options.add_argument('--disable-dev-shm-usage')
      options.add_argument('--remote-debugging-port=9222')
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end
    # Log in the user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  it 'allows an item to be created' do
    visit new_user_item_path(user)
    fill_in 'Name', with: 'Test Item'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Price', with: '9.99'
    check 'Availability'
    click_on 'Create Item'
    expect(page).to have_content('Item was successfully created.')
  end

  it 'shows errors when item creation fails' do
    visit new_user_item_path(user)
    fill_in 'Name', with: ''
    fill_in 'Description', with: ''
    fill_in 'Price', with: 'invalid'
    click_on 'Create Item'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('Price is not a number')
  end
end