FactoryBot.define do
  factory :plant do
    name { "MyString" }
    water_level { 1 }
    food_level { 1 }
    breed_id { nil }
    alive { false }
    growth_stage { 1 }
  end
end
