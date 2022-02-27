class RenameNomorPengeluaranToNomorPenjualan < ActiveRecord::Migration[5.2]
  def change
    rename_column :sales, :nomor_pengeluaran, :nomor_penjualan
  end
end
