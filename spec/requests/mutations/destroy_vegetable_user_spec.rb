require 'rails_helper'

RSpec.describe 'destroy_vegetable_user', type: :request do
  it 'destroys a user vegetable' do
    veg = create(:vegetable)
    user = create(:user)
    veg_user = create(:vegetable_user, user: user, vegetable: veg)

    expect(VegetableUser.count).to eq(1)
    
    destroy_veg_user = graph_destroy_veggie_user(veg_user.id)
    
    expect(VegetableUser.count).to eq(0)

    expect(response).to be_successful
  
    expect(destroy_veg_user[:data][:destroyVegetableUser][:id]).to be_a String
    expect(destroy_veg_user[:data][:destroyVegetableUser][:userId]).to be_an Integer
    expect(destroy_veg_user[:data][:destroyVegetableUser][:vegetableId]).to be_an Integer
  end

  private

  def graph_destroy_veggie_user(veg_user_id)
    gql <<-GQL
    mutation {
      destroyVegetableUser(input:{
          vegetableUserId: "#{veg_user_id}",
      }
      ) {
          id
          userId
          vegetableId
      }
    }
    GQL
  end
end