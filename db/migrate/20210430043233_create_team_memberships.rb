class CreateTeamMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :team_memberships do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
