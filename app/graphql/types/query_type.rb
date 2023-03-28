module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :vegetables_by_zipcode, Types::ZipcodeResultType, null: false do
      description 'Returns a zone and basic vegetable details'
      argument :zipcode, String, required: true
    end

    def vegetables_by_zipcode(args)
      zone = GrowZoneFacade.get_zone(args[:zipcode])

      {
        grow_zone: zone, # temp while service is built
        vegetables: Vegetable.all
      }
    end
  end
end
