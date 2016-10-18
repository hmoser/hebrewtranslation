class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.integer :translation_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
