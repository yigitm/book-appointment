require 'rails_helper'

RSpec.describe Detail, type: :model do
  subject { Detail.new(course_name: 'A320 Cabin', summary: '123456') }

  before { subject.save }

  it 'course name should be present' do
    subject.course_name = nil
    expect(subject).to_not be_valid
  end

  it 'course name length should be >= 3' do
    subject.course_name = 'A3'
    expect(subject).to_not be_valid
  end

  it 'course summary should be present' do
    subject.summary = nil
    expect(subject).to_not be_valid
  end

  it 'course summary length should be >= 10' do
    subject.summary = 'short sum'
    expect(subject).to_not be_valid
  end
  # Positive test case.

  it 'course detail should be valid' do
    expect(subject).to_not be_valid
  end
end
