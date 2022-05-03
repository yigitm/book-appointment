require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'Test User', password:'123456') }

  before { subject.save }

  it 'name should be present' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'name should be >= 3 letters' do
    subject.username = 'Te'
    expect(subject).to_not be_valid
  end

  it 'name should be <= 30 letters' do
    subject.username = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcde'
    expect(subject).to_not be_valid
  end

  it 'username should be unique & not be case sensitive' do
    subject_two = User.new(username: 'test user', password:'123456')
    expect(subject_two).to_not be_valid
  end

  it 'password should be >= 6' do
    subject.password = '12345'
    expect(subject).to_not be_valid
  end
end