class Task < ApplicationRecord
  TYPES = %w[Bug Feature Epic]
  belongs_to :employee, optional: true
  belongs_to :team, optional: true
end