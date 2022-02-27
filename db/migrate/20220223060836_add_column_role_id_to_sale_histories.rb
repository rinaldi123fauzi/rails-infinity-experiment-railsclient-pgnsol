class AddColumnRoleIdToSaleHistories < ActiveRecord::Migration[5.2]
  def change
    add_reference :sale_histories, :role, foreign_key: true
  end
end
