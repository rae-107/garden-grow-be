module Mutations
  class DestroyVegetableUser < BaseMutation
    argument :vegetable_user_id, String, required: true

    type Types::VegetableUserType

    def resolve(vegetable_user_id: nil)
      veg = VegetableUser.find(vegetable_user_id)
      veg.destroy!

    end
    
  end
end