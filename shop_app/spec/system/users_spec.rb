require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe "Users", type: :system do
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
  end

  it 'allows a user to sign up' do
    visit new_user_registration_path
    fill_in 'User name', with: 'testname123'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
