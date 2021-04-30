class PositionResource < ApplicationResource
  attribute :title, :string
  attribute :active, :boolean

  attribute :historical_index, :integer, only: [:sortable]

  # filter :employee_id, :integer
  # has same effects
  attribute :employee_id, :integer, readable: false
  attribute :department_id, :integer, readable: false

  belongs_to :employee
  belongs_to :department

  filter :current, :boolean do
    eq { |scope, value| scope.current(value) }
  end
end
