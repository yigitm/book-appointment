# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :user

  has_one :detail, dependent: :destroy

  validates :course_type, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :info, presence: true, length: { minimum: 10 }
end
