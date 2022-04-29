class Course < ApplicationRecord
  belongs_to :user

  has_one :detail
end
