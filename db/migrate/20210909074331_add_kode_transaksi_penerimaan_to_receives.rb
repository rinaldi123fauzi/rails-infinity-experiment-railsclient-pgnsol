class AddKodeTransaksiPenerimaanToReceives < ActiveRecord::Migration[5.2]
  def change
    add_column :receives, :kode_transaksi_penerimaan, :string
  end
end
