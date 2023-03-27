class CreateVegetableUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :vegetable_users do |t|
      t.references :user, foreign_key: true
      t.references :vegetable, foreign_key: true
      t.string :notes

      t.timestamps
    end
  end
end
