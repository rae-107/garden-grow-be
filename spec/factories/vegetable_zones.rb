FactoryBot.define do
  factory :vegetable_zone do
    association :vegetable
    zone { "MyString" }
    plant_seeds_indoors_start { "MyString" }
    plant_seeds_indoors_end { "MyString" }
    plant_seedlings_start { "MyString" }
    plant_seedlings_end { "MyString" }
    plant_seeds_outdoors_start { "MyString" }
    plant_seeds_outdoors_end { "MyString" }
  end
end
