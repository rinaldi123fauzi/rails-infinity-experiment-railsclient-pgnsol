class DeleteTablePenerimaanApprovals < ActiveRecord::Migration[5.2]
  def change
    drop_table :pengeluaran_approvals
  end
end
