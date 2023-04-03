require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    # Note to put validations in once there is a filled out .csv
    # it { should validate_presence_of :zipcode }
  end

  context 'relationships' do
    it { should have_many(:vegetable_users) } 
    it { should have_many(:vegetables).through(:vegetable_users) } 
  end
end
