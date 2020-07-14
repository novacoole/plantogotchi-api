FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "MyString" }
    bio { "MyText" }
    location { "MyString" }
    admin { false }
  end
end
