class Event < ApplicationRecord
    enum event_type: [ :born, :water, :food, :growth, :finished ]

    belongs_to :plant
end
