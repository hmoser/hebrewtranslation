class CreateRankings < ActiveRecord::Migration[5.0]
  def change
    create_table :rankings do |t|
      t.integer :translation_id
      t.integer :rank
      t.integer :user_id

      t.timestamps
    end
  end
end
