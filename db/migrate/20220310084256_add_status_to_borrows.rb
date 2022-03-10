class AddStatusToBorrows < ActiveRecord::Migration[6.0]
  def change
    add_column :borrows, :status, :integer
  end
end
