require 'rails_helper'

RSpec.describe GrowZone, type: :poro do
  context 'attributes' do
    it 'initializes with attributes' do
      json = {:hardiness_zone=>"5b", :zipcode=>"80218"}
      grow_zone = GrowZone.new(json)

      expect(grow_zone).to be_a(GrowZone)
      expect(grow_zone.zone).to eq("5b")
    end
  end
end