require 'rails_helper'

RSpec.describe PlantsController, type: :controller do
  it do
    attributes = attributes_for(:plant)
    should permit(:name, :water_level, :food_level, :breed_id, :user_id, :alive, :growth_stage)
      .for(:create, params: {plant: attributes})
      .on(:plant)
  end
end
