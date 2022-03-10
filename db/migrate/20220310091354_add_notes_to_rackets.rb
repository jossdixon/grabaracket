class AddNotesToRackets < ActiveRecord::Migration[6.0]
  def change
    add_column :rackets, :notes, :string
  end
end
