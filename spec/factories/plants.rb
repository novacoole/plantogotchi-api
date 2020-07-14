FactoryBot.define do
  factory :plant do
    name { "mybaby" }
    water_level { 100 }
    food_level { 100 }
    breed_id { 1 }
    alive { true }
    growth_stage { 1 }
  end
end
