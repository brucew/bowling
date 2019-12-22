class AddShotsNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :shots, :number, :integer, null: false
  end
end
