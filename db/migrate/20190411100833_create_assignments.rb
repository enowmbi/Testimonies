class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :tag, foreign_key: true
      t.references :testimony, foreign_key: true

      t.timestamps
    end
  end
end
