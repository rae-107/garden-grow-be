module Types
  class MutationType < Types::BaseObject
    field :create_vegetable_user, mutation: Mutations::CreateVegetableUser
  end
end
