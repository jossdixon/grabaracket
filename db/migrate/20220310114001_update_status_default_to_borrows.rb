class UpdateStatusDefaultToBorrows < ActiveRecord::Migration[6.0]
  def change
    change_column_default :borrows, :status, from: nil, to: 0
  end
end
