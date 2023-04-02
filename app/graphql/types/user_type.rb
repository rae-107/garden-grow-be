# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :grow_zone, String
    field :img, String
    field :linked_in, String
    field :github, String
    field :email, String
    field :about_me, String
    field :saved_vegetables, [Types::VegetableUserType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
