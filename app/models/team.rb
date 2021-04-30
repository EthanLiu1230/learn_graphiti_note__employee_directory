class Team < ApplicationRecord
  belongs_to :department
  has_many :team_memberships
  has_many :employees, through: :team_memberships
  has_many :notes, as: :notable
  has_many :tasks
  has_many :bugs
  has_many :features
  has_many :epics
end
