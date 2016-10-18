class CreateOriginals < ActiveRecord::Migration[5.0]
  def change
    create_table :originals do |t|
      t.string :title
      t.string :upload
      t.integer :assignment_id
      t.string :language

      t.timestamps
    end
  end
end
