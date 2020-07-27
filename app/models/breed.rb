class Breed < ApplicationRecord
  has_many :plants
  validates :name, :description, :max_growth, presence: true
  validates :max_growth, numericality: { greater_than: 10 }
  validates :description, length: { minimum: 20 }
  has_one_attached :spritesheet
end
