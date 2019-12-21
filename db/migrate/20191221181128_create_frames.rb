class CreateFrames < ActiveRecord::Migration[5.2]
  def change
    create_table :frames do |t|
      t.belongs_to :game
      t.column :number, :integer, null: false
      
      t.timestamps
    end
  end
end
