class PlantSerializer < ActiveModel::Serializer
  include AmsLazyRelationships::Core

  attributes %i[
    id
    name
    water_level
    food_level
    breed_id
    user_id
    alive
    growth_stage
    created_at
    updated_at
    breed
  ]

  lazy_has_many :events
  lazy_belongs_to :breed

  # Attaches last 10 events to each plant object in JSON.
  def events
    object.events.last(10)
  end

  # Attaches the breed of the plant object in JSON.
  def breed
    BreedSerializer.new(object.breed)
  end
end
