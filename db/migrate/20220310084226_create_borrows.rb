class CreateBorrows < ActiveRecord::Migration[6.0]
  def change
    create_table :borrows do |t|
      t.date :start_date
      t.date :end_date
      t.references :users, null: false, foreign_key: true
      t.references :rackets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
