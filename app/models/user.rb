class User < ApplicationRecord
  validates_presence_of :name
  has_many :vegetable_users
  has_many :vegetables, through: :vegetable_users
end
