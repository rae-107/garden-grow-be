FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    grow_zone { "5b" }
    img { "img" }
    linked_in { "linked_in" }
    github { 'github name' }
    email { Faker::Internet.email }
    about_me { 'this is about me' }
  end
end
