class RenameShotsPinsKnockedDownToScore < ActiveRecord::Migration[5.2]
  def change
    rename_column :shots, :pins_knocked_down, :score
  end
end
