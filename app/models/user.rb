class User < ApplicationRecord
  has_many :categories
  has_many :purchases

  validates :name, presence: true
end
