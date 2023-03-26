class CreateVegetables < ActiveRecord::Migration[5.2]
  def change
    create_table :vegetables do |t|
      t.string :name
      t.string :description
      t.string :sun
      t.string :water
      t.string :row_spacing
      t.string :seed_spacing
      t.string :growing_duration
      t.string :image

      t.timestamps
    end
  end
end
