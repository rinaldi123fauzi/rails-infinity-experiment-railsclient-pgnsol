class AddStatusApprovalToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :status_approval, :string
  end
end
