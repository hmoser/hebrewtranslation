class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :text

      t.timestamps
    end
  end
end
