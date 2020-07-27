class PlantSerializer < ActiveModel::Serializer
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
    events
  ]

  def events
    object.events.last(10)
  end

  def breed
    BreedSerializer.new(object.breed)
  end
end
