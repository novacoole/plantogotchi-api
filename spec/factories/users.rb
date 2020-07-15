FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "TestUsername#{n}"
    end
    sequence :email do |n|
      "email@email#{n}.com"
    end
    password { "secure_Password!" }
    bio { "This is an example bio statement." }
    location { "Location" }
    admin { false }
  end
end
