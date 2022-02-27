class AddCatatanPengeluaranPenjualanToPengeluaranApproval < ActiveRecord::Migration[5.2]
  def change
    add_column :pengeluaran_approvals, :catatan_pengeluaran_penjualan, :string
  end
end
