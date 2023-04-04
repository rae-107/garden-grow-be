require 'rails_helper'
require 'rake'

RSpec.describe 'csv_load rake task', type: :task do
  before :each do
    Rake.application.rake_require('tasks/csv_load')
    Rake::Task.define_task(:environment)
  end
  
  describe 'single task tests' do
    it 'loads and imports csv files to db' do
      expect { Rake::Task['csv_load:vegetables'].invoke }.to change { Vegetable.count }.by(21)
    end

    it 'loads and imports csv files to db' do
      Rake::Task['csv_load:vegetables'].execute
      expect { Rake::Task['csv_load:vegetable_zones'].invoke }.to change { VegetableZone.count }.by(525)
    end

    it 'loads and imports csv files to db' do
      expect { Rake::Task['csv_load:users'].invoke }.to change { User.count }.by(7)
    end

    it 'loads and imports csv files to db' do
      Rake::Task['csv_load:vegetables'].execute
      Rake::Task['csv_load:users'].execute
      expect { Rake::Task['csv_load:vegetable_users'].invoke }.to change { VegetableUser.count }.by(10)
    end
    
    it 'loads and imports csv files to db' do
      Rake::Task['csv_load:vegetables'].reenable
      Rake::Task['csv_load:vegetable_zones'].reenable
      Rake::Task['csv_load:users'].reenable
      Rake::Task['csv_load:vegetable_users'].reenable

      expect(Vegetable.count).to eq(0)
      expect(VegetableZone.count).to eq(0)
      expect(User.count).to eq(0)
      expect(VegetableUser.count).to eq(0)
      
      Rake::Task['csv_load:all'].invoke

      expect(Vegetable.count).to eq(21)
      expect(VegetableZone.count).to eq(525)
      expect(User.count).to eq(7)
      expect(VegetableUser.count).to eq(10)
    end
  end
end