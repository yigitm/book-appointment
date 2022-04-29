class Course < ApplicationRecord
  belongs_to :user

  has_one :detail

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :info, presence: true, length: { minimum: 10 }
end