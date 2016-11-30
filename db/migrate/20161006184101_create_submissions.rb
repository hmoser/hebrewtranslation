class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.integer :assignment_id
      t.integer :original_id
      t.integer :grade
      t.integer :user_id
      t.integer :translation_id

      t.timestamps
    end
  end
end
