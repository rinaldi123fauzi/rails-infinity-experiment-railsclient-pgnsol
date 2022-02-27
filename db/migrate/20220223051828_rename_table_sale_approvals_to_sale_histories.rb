class RenameTableSaleApprovalsToSaleHistories < ActiveRecord::Migration[5.2]
  def change
    rename_table :sale_histories, :sale_histories
  end
end
