class AddStuffToOriginals < ActiveRecord::Migration[5.0]
  def change
    add_column :originals, :stuff, :string
  end
end
