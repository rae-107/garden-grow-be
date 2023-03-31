# frozen_string_literal: true

module Types
  class VegetableUserType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :user, Types::UserType
    field :vegetable_id, Integer
    field :vegetable, Types::VegetableType
    field :notes, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
