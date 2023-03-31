class User < ApplicationRecord
  validates_presence_of :name, :zipcode
  has_many :vegetable_users
  has_many :vegetables, through: :vegetable_users
end
