require 'rails_helper'

RSpec.describe "Users", type: :system do
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
