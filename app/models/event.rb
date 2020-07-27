class Event < ApplicationRecord
    validates :event_type, :amount, presence: true  
    
    enum event_type: [ :born, :water, :food, :growth, :finished, :died ]

    belongs_to :plant
end
