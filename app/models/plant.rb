class Plant < ApplicationRecord
  validates :name, :water_level, :food_level, :breeds_id, :users_id, :alive, :growth_stage, presence: true  
  validates :water_level, numericality: { equal_to: 100 }
  validates :food_level, numericality: { equal_to: 100 }
  validates :growth_stage, numericality: { equal_to: 1 }
  validates :name, length: { minimum: 3 }
  validates :alive, acceptance: true

  belongs_to :breed
  belongs_to :user
end
