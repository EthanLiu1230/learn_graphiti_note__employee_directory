class MilestoneResource < ApplicationResource
  attribute :name, :string
  attribute :epic_id, :integer, only: [:filterable]

  # Customize the link to the Tasks endpoint, as we
  # didn't create an Epics endpoint
  belongs_to :epic do
    link :link do |milestone|
      helpers = Rails.application.routes.url_helpers
      helpers.task_url(milestone.epic_id)
    end
  end
end
