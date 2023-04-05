require 'rails_helper'

RSpec.describe 'vegetables_by_zipcode', type: :request do
  it 'returns a list of growing zone and vegetables by zipcode', :vcr do
    veg1 = create(:vegetable, name: 'Arugula', image: 'arugula.jpg')
    veg2 = create(:vegetable, name: 'Tomato', image: 'tomato.jpg')

    veggies = query_vegetables_by_zipcode('80817')

    expect(response).to be_successful

    expect(veggies[:data][:vegetablesByZipcode][:growZone]).to eq('6a')
    expect(veggies[:data][:vegetablesByZipcode][:vegetables]).to be_an Array
    expect(veggies[:data][:vegetablesByZipcode][:vegetables].count).to eq(2)
    expect(veggies[:data][:vegetablesByZipcode][:vegetables][0][:id]).to eq(veg1.id.to_s)
    expect(veggies[:data][:vegetablesByZipcode][:vegetables][0][:name]).to eq('Arugula')
    expect(veggies[:data][:vegetablesByZipcode][:vegetables][0][:image]).to eq('arugula.jpg')
    expect(veggies[:data][:vegetablesByZipcode][:vegetables][1][:id]).to eq(veg2.id.to_s)
    expect(veggies[:data][:vegetablesByZipcode][:vegetables][1][:name]).to eq('Tomato')
    expect(veggies[:data][:vegetablesByZipcode][:vegetables][1][:image]).to eq('tomato.jpg')
  end

  it 'gracefully handles a bad zipcode', :vcr do
    zip_query = query_vegetables_by_zipcode('1')

    expect(zip_query).to have_key(:errors)
    expect(zip_query[:errors][0][:message]).to eq('Zipcode returned no result')
  end

  private

  def query_vegetables_by_zipcode(zipcode)
    gql <<-GQL
    query{
      vegetablesByZipcode(
          zipcode: "#{zipcode}"
          ) {
             growZone
             vegetables {
                 id
                 name
                 image
             }
      }
  }
    GQL
  end
end
