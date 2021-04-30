class EmployeeResource < ApplicationResource
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :age, :integer
  attribute :created_at, :datetime, writeable: false
  attribute :updated_at, :datetime, writeable: false
  attribute :title, :string, only: [:filterable, :sortable]

  has_many :positions

  has_one :current_position, resource: PositionResource do
    params do |hash|
      hash[:filter][:current] = true
    end
  end

  many_to_many :teams

  sort :title do |scope, direction|
    scope.joins(:current_position).merge(Position.order(title: direction))
  end
  sort :department_name, :string do |scope, value|
    scope.joins(current_position: :department).merge(Department.order(name: value))
  end

  filter :title do
    eq do |scope, value|
      scope.joins(:current_position).merge(Position.where(title: value))
    end
  end
end
