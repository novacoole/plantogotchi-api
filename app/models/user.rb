class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :username, uniqueness: true, length: { minimum: 3 }
  has_secure_password
  validates :email, email: true, uniqueness: true

  has_many :plants
end
