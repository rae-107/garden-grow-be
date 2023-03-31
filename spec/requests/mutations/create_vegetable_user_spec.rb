require 'rails_helper'

RSpec.describe 'vegetables_by_zipcode', type: :request do
  it 'returns a list of growing zone and vegetables by zipcode' do
    veg = create(:vegetable, name: 'Arugula', image: 'arugula.jpg')
    user = create(:user, name: 'Alex')

    expect(VegetableUser.all.count).to eq(0)

    veg_user = graph_create_veggie_user(user.id, veg.id)

    expect(response).to be_successful

    expect(VegetableUser.all.count).to eq(1)
    expect(veg_user[:data][:createVegetableUser][:id]).to be_a String
    expect(veg_user[:data][:createVegetableUser][:userId]).to eq(user.id)
    expect(veg_user[:data][:createVegetableUser][:vegetableId]).to eq(veg.id)
  end

  private

  def graph_create_veggie_user(user, veg)
    gql <<-GQL
    mutation {
      createVegetableUser(input:{
          userId: "#{user}",
          vegetableId: "#{veg}"
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
