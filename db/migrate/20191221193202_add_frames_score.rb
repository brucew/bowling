class AddFramesScore < ActiveRecord::Migration[5.2]
  def change
    add_column :frames, :score, :integer, null: false
  end
end
