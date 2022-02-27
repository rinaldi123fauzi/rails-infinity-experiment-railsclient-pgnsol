class RenameTanggalPengeluaranToTanggalPenjualan < ActiveRecord::Migration[5.2]
  def change
    rename_column :sales, :tanggal_pengeluaran, :tanggal_penjualan
  end
end
