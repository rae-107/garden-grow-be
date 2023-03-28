# frozen_string_literal: true

module Types
  class VegetableZoneType < Types::BaseObject
    field :id, ID, null: false
    field :vegetable_id, Integer, null: false
    field :vegetables, [Types::VegetableType], null: false
    field :zone, String, null: true
    field :plant_seeds_indoors_start, String, null: true
    field :plant_seeds_indoors_end, String, null: true
    field :plant_seedlings_start, String, null: true
    field :plant_seedlings_end, String, null: true
    field :plant_seeds_outdoors_start, String, null: true
    field :plant_seeds_outdoors_end, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
