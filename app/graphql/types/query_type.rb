module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :vegetables_by_zipcode, Types::ZipcodeResultType, null: false do
      description 'Returns a zone and basic vegetable details'
      argument :zipcode, String, required: true
    end

    def vegetables_by_zipcode(args)
      zone = get_grow_zone(args)
      require 'pry'; binding.pry
      {
        grow_zone: zone,
        vegetables: Vegetable.all
      }
    end

    private

    def get_grow_zone(args)
      Rails.cache.fetch("grow_zone_query-#{args[:zipcode]}", expires_in: 24.hours) do
        GrowZoneFacade.get_zone(args[:zipcode])
      end
    end
  end
end
