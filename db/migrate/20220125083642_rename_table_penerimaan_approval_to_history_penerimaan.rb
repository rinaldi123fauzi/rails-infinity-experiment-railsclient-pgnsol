class RenameTablePenerimaanApprovalToHistoryPenerimaan < ActiveRecord::Migration[5.2]
  def change
    rename_table :penerimaan_approvals, :receive_history
  end
end
