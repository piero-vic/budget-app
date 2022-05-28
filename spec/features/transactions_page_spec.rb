require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.feature 'Transactions page', type: :feature do
  before :each do
    DatabaseCleaner.clean

    john = User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password123')
    john_groceries = Category.create(name: 'Groceries', icon: 'basket-shopping', user: john)
    Expense.create(name: 'Eggs', amount: 9.99, user: john, category: john_groceries)

    log_in_with 'john.doe@example.com', 'password123'
    visit category_path(john_groceries.id)
  end

  it 'should display the transactions' do
    expect(page).to have_content('Eggs')
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
