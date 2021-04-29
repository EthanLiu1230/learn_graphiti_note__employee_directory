class PositionResource < ApplicationResource
  attribute :title, :string
  attribute :active, :boolean

  attribute :historical_index, :integer, only: [:sortable]

  # By adding `fk filter`, we can:
  # - enable eager-loading(side-loading):
  #
  # ?include=positions
  filter :employee_id, :integer
end
