class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.datetime :due_date
      t.string :title

      t.timestamps
    end
  end
end
