FactoryBot.define do
  factory :breed do
    name { "breed" }
    description { "short description of this breed, blah blah" }
    max_growth { 25 }
    
    trait :invalid do
      name {nil}
      description {nil}
    end
  end

end
