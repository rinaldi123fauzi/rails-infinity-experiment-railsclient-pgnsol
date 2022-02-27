class CreateReturs < ActiveRecord::Migration[5.2]
  def change
    create_table :returs do |t|
      t.string :jenis_penerimaan
      t.string :nomor_pengeluaran
      t.string :kode_proyek
      t.string :nama_proyek
      t.string :jenis_pengeluaran
      t.string :asal_gudang
      t.string :gudang_pembelian
      t.string :nama_inputer
      t.json :dokumen_retur
      t.string :keterangan_retur

      t.timestamps
    end
  end
end
