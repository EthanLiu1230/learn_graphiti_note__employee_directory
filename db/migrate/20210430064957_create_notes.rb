class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.references :notable, polymorphic: true, null: false
      t.text :body

      t.timestamps
    end
  end
end
