require 'rails_helper'

RSpec.describe 'vegetable_details', type: :request do
  it 'returns details of a specific vegetable', :vcr do
    veg1 = create(:vegetable, name: 'Arugula', description: 'icky', sun: '6-8 hours of sun', water: '3 inches ',
                              row_spacing: '6 inches', seed_spacing: '6 inches', growing_duration: '20-50 days', image: 'arugula.jpg')
    veg2 = create(:vegetable, name: 'Beets', description: 'super icky', sun: 'Full Sun', water: '1 inch',
                              row_spacing: '4-6 inches', seed_spacing: '2-4 inches', growing_duration: '55-70 days', image: 'beet.jpg')
    veg_zone1 = create(:vegetable_zone, zone: '5a', vegetable: veg1, plant_seeds_indoors_start: nil,
                                        plant_seeds_indoors_end: nil, plant_seedlings_start: nil, plant_seedlings_end: nil, plant_seeds_outdoors_start: 'April 25', plant_seeds_outdoors_end: 'May 16')
    veg_zone2 = create(:vegetable_zone, zone: '5a', vegetable: veg2, plant_seeds_indoors_start: nil,
                                        plant_seeds_indoors_end: nil, plant_seedlings_start: nil, plant_seedlings_end: nil, plant_seeds_outdoors_start: 'April 25', plant_seeds_outdoors_end: 'May 16')
    veggies = query_vegetable_details(veg1.id, '5a')

    expect(response).to be_successful

    expect(veggies[:data][:vegetableDetails][:name]).to be_a String
    expect(veggies[:data][:vegetableDetails][:name]).to eq('Arugula')
    expect(veggies[:data][:vegetableDetails][:description]).to eq('icky')
    expect(veggies[:data][:vegetableDetails][:sun]).to eq('6-8 hours of sun')
    expect(veggies[:data][:vegetableDetails][:water]).to eq('3 inches ')
    expect(veggies[:data][:vegetableDetails][:rowSpacing]).to eq('6 inches')
    expect(veggies[:data][:vegetableDetails][:seedSpacing]).to eq('6 inches')
    expect(veggies[:data][:vegetableDetails][:growingDuration]).to eq('20-50 days')
    expect(veggies[:data][:vegetableDetails][:image]).to eq('arugula.jpg')
    expect(veggies[:data][:vegetableDetails][:zoneDetails]).to be_a Hash
    expect(veggies[:data][:vegetableDetails][:zoneDetails][:plantSeedsIndoorStart]).to eq(nil)
    expect(veggies[:data][:vegetableDetails][:zoneDetails][:plantSeedsIndoorEnd]).to eq(nil)
    expect(veggies[:data][:vegetableDetails][:zoneDetails][:plantSeddlingsStart]).to eq(nil)
    expect(veggies[:data][:vegetableDetails][:zoneDetails][:plantSeedlingsEnd]).to eq(nil)
    expect(veggies[:data][:vegetableDetails][:zoneDetails][:plantSeedsOutdoorsStart]).to eq('April 25')
    expect(veggies[:data][:vegetableDetails][:zoneDetails][:plantSeedsOutdoorsEnd]).to eq('May 16')
  end

  describe 'Types::VegetableType' do
    describe 'query_vegetable_details' do
      before(:each) do
        veg1 = create(:vegetable, name: 'Arugula', description: 'icky', sun: '6-8 hours of sun', water: '3 inches ',
                              row_spacing: '6 inches', seed_spacing: '6 inches', growing_duration: '20-50 days', image: 'arugula.jpg')
        veg_zone1 = create(:vegetable_zone, zone: '5a', vegetable: veg1, plant_seeds_indoors_start: nil,
                                        plant_seeds_indoors_end: nil, plant_seedlings_start: nil, plant_seedlings_end: nil, plant_seeds_outdoors_start: 'April 25', plant_seeds_outdoors_end: 'May 16')
        
      end
      context 'with missing vegetableId' do
        it 'returns an error' do
          # Execute the query with missing vegetableId
      
          # result = Types::QueryType.execute(query_vegetable_details('invalid_id', 'zone'))
          query_vegetable_details_null
          # Assert that the query returns an error

          expect(response).to have_http_status(200)
          json_response = JSON.parse(response.body)
          expect(json_response).to have_key('errors')
        end
      end

      context 'with missing zone' do
        it 'with missing zone, returns an error' do
          veg1 = create(:vegetable, name: 'Arugula', description: 'icky', sun: '6-8 hours of sun', water: '3 inches ',
                              row_spacing: '6 inches', seed_spacing: '6 inches', growing_duration: '20-50 days', image: 'arugula.jpg')
          # Execute the query with missing zone
          query_vegetable_details_zone(veg1.id)


          # Assert that the query returns an error
          expect(response).to have_http_status(200)
          json_response = JSON.parse(response.body)
          expect(json_response).to have_key('errors')
        end
      end

      context 'with invalid vegetableId' do
        it 'returns an error' do
          veg1 = create(:vegetable, name: 'Arugula', description: 'icky', sun: '6-8 hours of sun', water: '3 inches ',
                              row_spacing: '6 inches', seed_spacing: '6 inches', growing_duration: '20-50 days', image: 'arugula.jpg')
          # Execute the query with invalid vegetableId
          query_vegetable_details(veg1, '5a')


          # Assert that the query returns an error
          expect(response).to have_http_status(200)
          json_response = JSON.parse(response.body)
          expect(json_response).to have_key('errors')
        end
      end

      context 'with invalid zone' do
        it 'returns an error' do
          veg1 = create(:vegetable, name: 'Arugula', description: 'icky', sun: '6-8 hours of sun', water: '3 inches ',
                              row_spacing: '6 inches', seed_spacing: '6 inches', growing_duration: '20-50 days', image: 'arugula.jpg')
          # Execute the query with invalid zone
         query_vegetable_details(veg1, '22a')
         
          # Assert that the query returns an error
          expect(response).to have_http_status(200)
          json_response = JSON.parse(response.body)
          expect(json_response).to have_key('errors')
        end
      end
    end
  end

  private

  def query_vegetable_details(id, zone)
    gql <<-GQL
    query{
      vegetableDetails(
          vegetableId: "#{id}"
          ) {
             name
             description
             sun
             water
             rowSpacing
             seedSpacing
             growingDuration
             image
             zoneDetails(
              zone: "#{zone}"
            )
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
    GQL
  end

  def query_vegetable_details_null
    gql <<-GQL
    query{
      vegetableDetails(
          vegetableId: null
          ) {
             name
             description
             sun
             water
             rowSpacing
             seedSpacing
             growingDuration
             image
             zoneDetails(
              zone: 
            )
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
    GQL
  end
  def query_vegetable_details_zone(id)
    gql <<-GQL
    query{
      vegetableDetails(
          vegetableId: "#{id}"
          ) {
             name
             description
             sun
             water
             rowSpacing
             seedSpacing
             growingDuration
             image
             zoneDetails(
              zone: null
            )
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
    GQL
  end
end
