class Event < ApplicationRecord
  validates :event_type, :amount, presence: true

  enum event_type: { born: 0, water: 1, food: 2, growth: 3, finished: 4, died: 5 }

  belongs_to :plant
end
