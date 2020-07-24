class Plant < ApplicationRecord
  validates :name, :water_level, :food_level, :growth_stage, presence: true  
  validates :water_level, numericality: { greater_than: -1, less_than: 151 }
  validates :food_level, numericality: { greater_than: -1, less_than: 151 }
  validates :growth_stage, numericality: { greater_than: 0, less_than: 26 }
  validates :name, length: { minimum: 3 }
  validates_inclusion_of :alive, in: [true, false]

  belongs_to :breed
  belongs_to :user
  has_many :events
end
