require 'rails_helper'

RSpec.describe VegetableZone, type: :model do
  it { should belongs_to :vegetable }
end
