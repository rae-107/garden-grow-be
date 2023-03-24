FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    zipcode { "MyString" }
  end
end
