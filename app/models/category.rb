class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def total_value
    expenses.map(&:amount).inject(&:+) || 0
  end

  def last_month_value
    expenses.where('created_at BETWEEN ? AND ?', 30.days.ago, Time.now).map(&:amount).inject(&:+) || 0
  end

  def last_modification
    return expenses.max_by(&:created_at)&.created_at if expenses.any?
  end
end
