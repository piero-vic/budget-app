require 'rails_helper'

RSpec.feature 'Transactions page', type: :feature do
  before :each do
    log_in_with 'john.doe@example.com', 'password123'
    @category = User.find_by(email: 'john.doe@example.com').categories.take
    visit category_path(@category.id)
  end

  it 'should have a link to the form to add a new transaction' do
    click_link 'ADD TRANSACTION'
    expect(page).to have_content('NEW TRANSACTION')
  end

  def log_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'LOG IN'
  end
end
