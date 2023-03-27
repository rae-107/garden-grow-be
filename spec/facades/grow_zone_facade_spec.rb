require 'rails_helper'

RSpec.describe GrowZoneFacade, type: :facade do
  context 'class methods' do
    it '#get_zone(zipcode)', :vcr do
      expect(GrowZoneFacade.get_zone(80218)).to eq("5b")
    end
  end
end