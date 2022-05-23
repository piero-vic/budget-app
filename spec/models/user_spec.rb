require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'John Doe')
  end

  before { subject.save }

  it 'should have name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
