require 'csv'

namespace :csv_load do
  desc "loads the vegetable csv file into db"
  task vegetables: :environment do
    csv = File.read("./db/data/vegetables.csv")
    CSV.parse(csv, headers: true).each do |row|
      require 'pry'; binding.pry
      Vegetable.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!("vegetables")
  end
end