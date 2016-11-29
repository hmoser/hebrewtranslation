class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.integer :user_id
      t.integer :original_id
      t.text :translation
      t.integer :assignment_id
      
      t.timestamps
    end
  end
end
