class TeamResource < ApplicationResource
  attribute :name, :string
  attribute :department_id, :integer, only: [:filterable]

  belongs_to :department
  many_to_many :employees
  has_many :tasks
  polymorphic_has_many :notes, as: :notable
end
