class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
