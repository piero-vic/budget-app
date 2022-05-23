require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    User.create(id: 1, name: 'John Doe')
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
end
