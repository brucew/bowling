class ChangeFramesScoreNotNullToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column :frames, :score, :integer, null: true
  end
end
