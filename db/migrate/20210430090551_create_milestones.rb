class CreateMilestones < ActiveRecord::Migration[6.1]
  def change
    create_table :milestones do |t|
      t.string :name
      t.belongs_to :epic, index: true

      t.timestamps
    end
  end
end
