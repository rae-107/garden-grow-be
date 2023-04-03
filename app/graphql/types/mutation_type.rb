module Types
  class MutationType < Types::BaseObject
    field :create_vegetable_user, mutation: Mutations::CreateVegetableUser
    field :update_vegetable_user, mutation: Mutations::UpdateVegetableUser
  end
end
