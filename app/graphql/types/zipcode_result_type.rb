# frozen_string_literal: true

module Types
  class ZipcodeResultType < Types::BaseObject
    field :grow_zone, String, null: false
    field :vegetables, [Types::VegetableType], null: false
  end
end
