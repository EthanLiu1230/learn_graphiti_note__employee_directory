class EmployeeResource < ApplicationResource
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :age, :integer
  attribute :created_at, :datetime, writeable: false
  attribute :updated_at, :datetime, writeable: false

  has_many :positions

  attribute :title, :string, only: [:filterable, :sortable]

  sort :title do |scope, direction|
    scope.joins(:current_position).merge(Position.order(title: direction))
  end

  filter :title do
    eq do |scope, value|
      scope.joins(:current_position).merge(Position.where(title: value))
    end
  end

  sort :department_name, :string do |scope, value|
    scope.joins(current_position: :department).merge(Department.order(name: value))
  end

  has_one :current_position, resource: PositionResource do
    params do |hash|
      hash[:filter][:current] = true
    end
  end
end
