require 'rails_helper'

RSpec.describe Vegetable, type: :model do
  describe "relationships" do
    it { should have_many :vegatable_users }   
    it { should have_many(:users).through(:vegatable_users) }   
  end
end
