class Event < ApplicationRecord
    enum event_type: [ :water, :food, :growth, :finished ]

    belongs_to :plant
end
