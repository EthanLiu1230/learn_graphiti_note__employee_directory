class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :team, null: false, foreign_key: true
      t.string :type
      t.string :title

      t.timestamps
    end
  end
end
