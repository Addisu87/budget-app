class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :categories, through: :purchases

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: false, greater_than_or_equal_to: 0 }
end
