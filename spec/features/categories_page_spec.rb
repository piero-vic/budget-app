require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.feature 'Categories page', type: :feature do
  before :each do
    DatabaseCleaner.clean

    john = User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password123')
    Category.create(name: 'Groceries', icon: 'basket-shopping', user: john)
    Category.create(name: 'Entertainment', icon: 'gamepad', user: john)
    Category.create(name: 'Health', icon: 'hospital', user: john)

    log_in_with 'john.doe@example.com', 'password123'
    visit categories_path
  end

  it 'should have a link to the transactions of a category' do
    click_link 'Groceries'
    expect(page).to have_content('GROCERIES')
  end

  it 'should have a link to the form to add a new category' do
    click_link 'ADD CATEGORY'
    expect(page).to have_content('NEW CATEGORY')
  end

  def log_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'LOG IN'
  end
end
