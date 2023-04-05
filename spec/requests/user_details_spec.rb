require 'rails_helper'

RSpec.describe 'user_details', type: :request do
  it 'returns details of a specific user', :vcr do
    user1 = create(:user)
    user2 = create(:user)
    vegetable1 = create(:vegetable)
    veg_user = create(:vegetable_user, user: user1, vegetable: vegetable1)

    user = query_user_details(user1.id, user1.grow_zone)

    expect(response).to be_successful

    expect(user[:data][:userDetails][:id]).to be_a String
    expect(user[:data][:userDetails][:id]).to eq(user1.id.to_s)
    expect(user[:data][:userDetails][:name]).to be_a String
    expect(user[:data][:userDetails][:name]).to eq(user1.name)
    expect(user[:data][:userDetails][:name]).to_not eq(user2.name)
    expect(user[:data][:userDetails][:growZone]).to eq(user1.grow_zone)
    expect(user[:data][:userDetails][:img]).to eq(user1.img)
    expect(user[:data][:userDetails][:linkedIn]).to eq(user1.linked_in)
    expect(user[:data][:userDetails][:github]).to eq(user1.github)
    expect(user[:data][:userDetails][:email]).to eq(user1.email)
    expect(user[:data][:userDetails][:aboutMe]).to eq(user1.about_me)
    expect(user[:data][:userDetails][:vegetableUsers]).to be_an Array
    expect(user[:data][:userDetails][:vegetableUsers].first[:vegetable][:name]).to eq(vegetable1.name)
  end

  describe 'UserDetailsQuery', type: :request do
    describe 'POST /graphql' do
      context 'with missing userId' do
        it 'returns an error' do
          # Execute the query with missing userId
          query_user_details_null

          # Assert that the response contains errors
          json_response = JSON.parse(response.body)
          expect(response).to have_http_status(200)
          expect(json_response).to have_key('errors')
        end
      end

      context 'with invalid userId' do
        it 'returns an error' do
          # Execute the query with invalid userId
          query_user_details('invalid', '5a')

          # Assert that the response contains errors
          json_response = JSON.parse(response.body)
          expect(response).to have_http_status(200)
          expect(json_response).to have_key('errors')
        end
      end
    end
  end

  private

  def query_user_details(id, zone)
    gql <<-GQL
    query{
      userDetails(
          userId: "#{id}"
          ) {
              id
              name
              growZone
              img
              linkedIn
              github
              email
              aboutMe
              vegetableUsers{
              vegetable{
                name
              }
             }
      }
  }
    GQL
  end

  def query_user_details_null
    gql <<-GQL
    query{
      userDetails(
          userId: null
          ) {
             name
             growZone
             img
             linkedIn
             github
             email
             aboutMe
      }
  }
    GQL
  end
end
