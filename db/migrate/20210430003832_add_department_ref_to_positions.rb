class AddDepartmentRefToPositions < ActiveRecord::Migration[6.1]
  def change
    add_reference :positions, :department, null: false, foreign_key: true
  end
end
