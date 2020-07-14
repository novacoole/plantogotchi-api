FactoryBot.define do
  factory :plant do
    name { "mybaby" }
    water_level { 100 }
    food_level { 100 }
    breeds_id { 1 }
    users_id { 1 }
    alive { true }
    growth_stage { 1 }

    before(:create) do |plant|
      breed = FactoryBot.create(:breed)
      user = FactoryBot.create(:user)
    end
  end
end
