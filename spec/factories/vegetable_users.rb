FactoryBot.define do
  factory :vegetable_user do
    association :user
    association :vegetable
    notes { "MyString" }
  end
end
