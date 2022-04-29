class Detail < ApplicationRecord
  belongs_to :course

  validates :course_name, presence: true
  validates :summary, presence: true, length: { minimum: 10 }
end
