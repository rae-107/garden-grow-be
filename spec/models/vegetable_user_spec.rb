require 'rails_helper'

RSpec.describe VegetableUser, type: :model do
  it { should belong_to :user }
  it { should belong_to :vegetable }
end
