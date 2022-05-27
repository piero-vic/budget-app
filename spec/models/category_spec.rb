require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    User.create(id: 1, name: 'John Doe', email: 'johndoe@example.com', password: 'password123')
  end

  subject do
    Category.new(name: 'Groceries', icon: 'shopping-cart', user_id: 1)
  end

  before { subject.save }

  it 'should have name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'should have the corresponding user' do
    expect(subject.user.id).to eql(1)
    expect(subject.user.name).to eql('John Doe')
  end

  describe '#total_value' do
    context 'when there are no expenses' do
      it 'should return 0' do
        expect(subject.total_value).to eql(0)
      end
    end

    context 'when there are expenses' do
      before do
        Expense.create(name: 'Eggs', amount: 9.99, user: subject.user, category: subject)
        Expense.create(name: 'Rice', amount: 19.99, user: subject.user, category: subject)
        Expense.create(name: 'Veggies', amount: 5.99, user: subject.user, category: subject)
      end

      it 'should return the sum of the expenses amounts' do
        expect(subject.total_value).to eql(35.97)
      end
    end
  end

  describe '#last_month_value' do
    before do
      Expense.create(name: 'Eggs', amount: 9.99, user: subject.user, category: subject)
      Expense.create(name: 'Rice', amount: 19.99, user: subject.user, category: subject, created_at: Date.today - 90)
      Expense.create(name: 'Veggies', amount: 5.99, user: subject.user, category: subject)
    end

    it 'should return the total value of the las 30 days' do
      expect(subject.last_month_value).to eql(15.98)
    end
  end

  describe '#last_modification' do
    context 'when there are no expenses' do
      it 'should return nil' do
        expect(subject.last_modification).to be_nil
      end
    end

    context 'when there are expenses' do
      before do
        Expense.create(name: 'Eggs', amount: 9.99, user: subject.user, category: subject)
        Expense.create(name: 'Rice', amount: 19.99, user: subject.user, category: subject)
        @last_expense = Expense.create(name: 'Veggies', amount: 5.99, user: subject.user, category: subject)
      end

      it 'should return the last modification' do
        expect(subject.last_modification).to eql(@last_expense.created_at)
      end
    end
  end
end
