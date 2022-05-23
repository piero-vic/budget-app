require 'rails_helper'

RSpec.describe Expense, type: :model do
  before do
    User.create(id: 1, name: 'John Doe')
    Category.create(id: 1, name: 'Groceries', icon: 'shopping-cart', user_id: 1)
  end

  subject do
    Expense.new(name: 'Eggs', amount: 9.99, user_id: 1, category_id: 1)
  end

  before { subject.save }

  it 'should have name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have an amount greater than 0' do
    subject.amount = 0
    expect(subject).to_not be_valid
  end

  it 'should have the corresponding user' do
    expect(subject.user.id).to eql(1)
    expect(subject.user.name).to eql('John Doe')
  end

  it 'should have the corresponding category_id' do
    expect(subject.category.id).to eql(1)
    expect(subject.category.name).to eql('Groceries')
  end
end
