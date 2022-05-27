require 'rails_helper'

RSpec.feature 'User sign up', type: :feature do
  scenario 'with valid name, email and password' do
    sign_up_with 'Mike Myers', 'mike.myers@example.com', 'password123'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'with empty name' do
    sign_up_with '', 'mike.myers@example.com', 'password123'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'with empty password' do
    sign_up_with 'Mike Myers', 'mike.myers@example.com', ''

    expect(page).to have_content("Password can't be blank")
  end

  def sign_up_with(name, email, password)
    visit new_user_registration_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password Confirmation', with: password
    click_button 'SIGN UP'
  end
end
