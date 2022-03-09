class CreateRackets < ActiveRecord::Migration[6.0]
  def change
    create_table :rackets do |t|
      t.string :brand
      t.string :model
      t.integer :grip_size
      t.integer :weight
      t.integer :head_size

      t.timestamps
    end
  end
end
