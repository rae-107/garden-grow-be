module Mutations
  class CreateVegetableUser < BaseMutation
    argument :user_id, String, required: true
    argument :vegetable_id, String, required: true

    type Types::VegetableUserType

    def resolve(user_id: nil, vegetable_id: nil)
      VegetableUser.create!(
        user_id: user_id,
        vegetable_id: vegetable_id
      )
    end
  end
end
