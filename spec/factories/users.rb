FactoryBot.define do
  factory :user do
    username { "TestUsername" }
    email { "email@email.com" }
    password { "validpassword" }
    bio { "This is an example bio statement." }
    location { "Location" }
    admin { false }
  end
end
