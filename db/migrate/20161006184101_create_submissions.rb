class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.integer :assignment_id
      t.string :assignment_title
      t.integer :original_id
      t.string :original_title
      t.integer :grade
      t.integer :user_id
      t.integer :translation_id

      t.timestamps
    end
  end
end
