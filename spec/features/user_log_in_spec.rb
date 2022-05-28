require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.feature 'User log in', type: :feature do
  before :each do
    DatabaseCleaner.clean
    User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password123')
  end

  scenario 'with valid email and password' do
    log_in_with 'john.doe@example.com', 'password123'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with invalid credentials' do
    log_in_with 'john.doe@example.com', 'password'

    expect(page).to have_content('Invalid Email or password.')
  end

  def log_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'LOG IN'
  end
end
