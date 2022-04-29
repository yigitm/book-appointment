class User < ApplicationRecord
  has_secure_password

  has_many :courses
  has_many :details, through: :courses
end
