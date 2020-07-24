class Event < ApplicationRecord
    enum event_type: [ :born, :water, :food, :growth, :finished, :died ]

    belongs_to :plant
end
