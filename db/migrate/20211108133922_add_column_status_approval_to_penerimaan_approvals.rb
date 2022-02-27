class AddColumnStatusApprovalToPenerimaanApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :penerimaan_approvals, :status_approval, :string
  end
end
