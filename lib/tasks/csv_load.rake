require 'csv'

namespace :csv_load do
  desc 'loads the vegetable csv file into db'
  task vegetables: :environment do
    csv = File.read('./db/data/vegetables.csv')
    CSV.parse(csv, headers: true).each do |row|
      Vegetable.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('vegetables')
  end

  desc 'loads the vegetable zones csv file into db'
  task vegetable_zones: :environment do
    csv = File.read('./db/data/vegetable_zones.csv')
    CSV.parse(csv, headers: true).each do |row|
      VegetableZone.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('vegetable_zones')
  end

  desc 'loads the preset users csv file into db'
  task users: :environment do
    csv = File.read('./db/data/users.csv')
    CSV.parse(csv, headers: true).each do |row|
      User.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('users')
  end

  desc 'loads the preset vegetable_users csv file into db'
  task vegetable_users: :environment do
    csv = File.read('./db/data/vegetable_users.csv')
    CSV.parse(csv, headers: true).each do |row|
      VegetableUser.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('vegetable_users')
  end

  desc 'load all csv files into db'
  task all: %i[vegetables vegetable_zones users vegetable_users] do
  end
end
