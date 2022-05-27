require 'rails_helper'

RSpec.feature 'User log in', type: :feature do
  scenario 'with valid email and password' do
    sign_up_with 'john.doe@example.com', 'password123'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with invalid credentials' do
    sign_up_with 'john.doe@example.com', 'password'

    expect(page).to have_content('Invalid Email or password.')
  end

  def sign_up_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'LOG IN'
  end
end
