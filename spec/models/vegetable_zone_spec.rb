require 'rails_helper'

RSpec.describe VegetableZone, type: :model do
  it { should belong_to :vegetable }
end
