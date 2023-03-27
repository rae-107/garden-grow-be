class Vegetable < ApplicationRecord
  has_many :vegetable_users
  has_many :users, through: :vegetable_users
end
