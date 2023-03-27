require 'rails_helper'

RSpec.describe VegetableUser, type: :model do
  it { should belongs_to :user }
  it { should belongs_to :vegetable }
end
