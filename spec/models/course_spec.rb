require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { Course.new(course_type: 'Pilot Courses', info: 'Pilot course category') }

  before { subject.save }

  it 'course type should be present' do
    subject.course_type = nil
    expect(subject).to_not be_valid
  end

  it 'course type length should be >= 3' do
    subject.course_type = 'Pc'
    expect(subject).to_not be_valid
  end

  it 'course type should be unique & not be case sensitive' do
    subject_two = Course.new(course_type: 'pilot courses', info: 'pilot course category')
    expect(subject_two).to_not be_valid
  end

  it 'course info should be present' do
    subject.info = nil
    expect(subject).to_not be_valid
  end

  it 'course type length should be >= 10' do
    subject.info = 'Pc'
    expect(subject).to_not be_valid
  end
end
