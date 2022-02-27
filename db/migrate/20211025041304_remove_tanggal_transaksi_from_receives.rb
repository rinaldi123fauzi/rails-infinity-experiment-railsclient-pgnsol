class RemoveTanggalTransaksiFromReceives < ActiveRecord::Migration[5.2]
  def change
    remove_column :receives, :tanggal_transaksi, :string
  end
end
