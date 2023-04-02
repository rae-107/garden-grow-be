require 'rails_helper'

RSpec.describe 'vegetable_details', type: :request do
  it 'returns details of a specific user', :vcr do
    user1 = create(:user) 
    user2 = create(:user) 

    user = query_user_details(user1.id)

    expect(response).to be_successful
require 'pry'; binding.pry
    expect(user[:data][:userDetails][:name]).to be_a String
    expect(user[:data][:userDetails][:name]).to eq(user1.name)
    expect(user[:data][:userDetails][:grow_zone]).to eq(user1.grow_zone)
    expect(user[:data][:userDetails][:img]).to eq(user1.img)
    expect(user[:data][:userDetails][:linked_in]).to eq(user1.linked_in)
    expect(user[:data][:userDetails][:github]).to eq(user1.github)
    expect(user[:data][:userDetails][:email]).to eq(user1.email)
    expect(user[:data][:userDetails][:about_me]).to eq(user1.about_me)
    expect(user[:data][:userDetails][:saved_vegetables]).to be_a Hash
  end

  private

  def query_user_details(id, zone)
    gql <<-GQL
    query{
      userDetails(
          userId: "#{id}"
          ) {
             name
             grow_zone
             img
             linked_in
             github
             email
             about_me
             saved_vegetables
             {
              vegetable
              {
                id
                name
                zoneDetails(zone: "#{zone}")
                {
                 plantSeedsIndoorsStart
                 plantSeedsIndoorsEnd
                 plantSeedlingsStart
                 plantSeedlingsEnd
                 plantSeedsOutdoorsStart
                 plantSeedsOutdoorsEnd
                }
              }
             }
      }
  }
    GQL
  end
end
