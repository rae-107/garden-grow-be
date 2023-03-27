class CreateVegetableZones < ActiveRecord::Migration[5.2]
  def change
    create_table :vegetable_zones do |t|
      t.references :vegetable, foreign_key: true
      t.string :zone
      t.string :plant_seeds_indoors_start
      t.string :plant_seeds_indoors_end
      t.string :plant_seedlings_start
      t.string :plant_seedlings_end
      t.string :plant_seeds_outdoors_start
      t.string :plant_seeds_outdoors_end

      t.timestamps
    end
  end
end
