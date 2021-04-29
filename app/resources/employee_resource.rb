class EmployeeResource < ApplicationResource
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :age, :integer
  attribute :created_at, :datetime, writeable: false
  attribute :updated_at, :datetime, writeable: false

  has_many :positions
end
