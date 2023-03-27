require 'rails_helper'

RSpec.describe Vegetable, type: :model do
  describe "relationships" do
    it { should have_many :vegetable_users }   
    it { should have_many(:users).through(:vegetable_users) }   
  end
end
