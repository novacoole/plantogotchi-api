FactoryBot.define do
  factory :plant do
    name { "mybaby" }
    water_level { 100 }
    food_level { 100 }
    association :breed 
    association :user 
    alive { true }
    growth_stage { 1 }
  end

end
