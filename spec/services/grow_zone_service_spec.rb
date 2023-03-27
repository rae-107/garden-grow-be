require 'rails_helper'

RSpec.describe GrowZoneService, type: :service do
  context 'class methods' do
    it 'returns a grow zone from supplied zipcode' do
      zipcode = '80218'
      service = GrowZoneService.get_zone(zipcode)

      expect(service).to be_a(Hash)
      expect(service).to have_key(:hardiness_zone)
      expect(service[:hardiness_zone]).to be_a(String)
      expect(service).to have_key(:zipcode)
      expect(service[:zipcode]).to be_a(String)
    end
  end
end