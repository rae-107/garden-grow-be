require 'csv'

namespace :csv_load do
  desc "loads the vegetable csv file into db"
  task vegetables: :environment do
    csv = File.read("./db/data/vegetables.csv")
    CSV.parse(csv, headers: true).each do |row|
      Vegetable.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!("vegetables")
  end

  desc "loads the vegetable zones csv file into db"
  task vegetable_zones: :environment do
    csv = File.read("./db/data/vegetable_zones.csv")
    CSV.parse(csv, headers: true).each do |row|
      VegetableZone.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!("vegetable_zones")
  end
  desc "load all csv files into db"
  task all: [:vegetables, :vegetable_zones] do
  end
end