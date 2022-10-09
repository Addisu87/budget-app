class Category < ApplicationRecord
  belongs_to :author
  has_many :purchases, dependent: :destroy

  validates :name, presence: true

  def total_records
    records.size
  end

  def total_records_amount
    records.sum(:amount)
  end
end
