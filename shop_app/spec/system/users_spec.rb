require 'rails_helper'

RSpec.describe "Users", type: :system do
  it 'allows a user to sign up' do
    visit new_user_registration_path
    fill_in 'Username', with: 'testname123'
  end

end
