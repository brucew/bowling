class CreateShot < ActiveRecord::Migration[5.2]
  def change
    create_table :shots do |t|
      t.belongs_to :frame
      t.column :pins_knocked_down, :integer, null: false

      t.timestamps
    end
  end
end
