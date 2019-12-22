class RemoveFramesScore < ActiveRecord::Migration[5.2]
  def change
    remove_column :frames, :score
  end
end
