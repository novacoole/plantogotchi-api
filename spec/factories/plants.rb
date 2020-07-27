FactoryBot.define do
  factory :plant do
    sequence :name do |n| 
      "mybaby#{n}"
    end
    water_level { 100 }
    food_level { 100 }
    breed
    user
    alive { true }
    growth_stage { 1 }

    trait :invalid do
      name {nil}
    end


    trait :update do
      sequence :name do |n| 
        "mybaby#{n}"
      end
      water_level { 60 }
      food_level { 60 }
      growth_stage { 2 }
    end
  end

end
