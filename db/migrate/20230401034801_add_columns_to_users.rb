class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :grow_zone, :string
    add_column :users, :img, :string
    add_column :users, :linked_in, :string
    add_column :users, :github, :string
    add_column :users, :email, :string
    add_column :users, :about_me, :string
  end
end
