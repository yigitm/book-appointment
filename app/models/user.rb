class User < ApplicationRecord
  has_secure_password

  has_many :courses, dependent: :destroy
  has_many :details, through: :courses

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 3..30 }
  validates :password, presence: true, length: { minimum: 6 }
end
