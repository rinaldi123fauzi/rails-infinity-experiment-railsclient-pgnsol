class RenameDokumenPengeluaranToDokumenPenjualan < ActiveRecord::Migration[5.2]
  def change
    rename_column :sales, :dokumen_pengeluaran, :dokumen_penjualan
  end
end
