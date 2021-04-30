class Position < ApplicationRecord
  belongs_to :employee
  belongs_to :department

  scope :current, ->(bool) do
    clause = { historical_index: 1 }
    bool ? where(clause) : where.not(clause)
  end
end
