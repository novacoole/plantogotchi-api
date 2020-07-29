class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :username, uniqueness: true, length: { minimum: 3 }
  validates :email, email: true, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 8 }, if: :password
  has_many :plants
end
