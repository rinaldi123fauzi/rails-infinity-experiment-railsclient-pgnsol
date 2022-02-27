class AddTanggalTransaksiToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :tanggal_transaksi, :string
  end
end
