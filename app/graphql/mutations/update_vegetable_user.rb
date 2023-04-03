module Mutations
  class UpdateVegetableUser < BaseMutation
    argument :vegetable_user_id, String, required: true
    argument :notes, String, required: true
    
    type Types::VegetableUserType

    def resolve(vegetable_user_id: nil, notes: nil)
      veg = VegetableUser.find(vegetable_user_id)
      veg.update(
        notes: notes
      )
      veg
    end
  end
end