require 'rails_helper'

RSpec.describe 'vegetables_by_user', type: :request do
  it 'updates a users notes' do
    veg = create(:vegetable, name: 'Arugula', image: 'arugula.jpg')
    user = create(:user, name: 'Alex')
    veg_user = create(:vegetable_user, user: user, vegetable: veg, notes: "I am hungry" )
 
    update_veg_user = graph_update_veggie_user(veg_user.id, "it is green")

    expect(response).to be_successful
  
    expect(update_veg_user[:data][:updateVegetableUser][:id]).to be_a String
    expect(update_veg_user[:data][:updateVegetableUser][:userId]).to be_an Integer
    expect(update_veg_user[:data][:updateVegetableUser][:vegetableId]).to be_an Integer
    expect(update_veg_user[:data][:updateVegetableUser][:notes]).to be_a String
    expect(update_veg_user[:data][:updateVegetableUser][:notes]).to eq("it is green")
  end

  private

  def graph_update_veggie_user(user, notes)
    gql <<-GQL
    mutation {
      updateVegetableUser(input:{
          vegetableUserId: "#{user}",
          notes: "#{notes}"
      }
      ) {
          id
          userId
          vegetableId
          notes
      }
    }
    GQL
  end
end