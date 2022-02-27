class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :nomor_pengeluaran
      t.date :tanggal_pengeluaran
      t.string :jenis_pengeluaran
      t.string :keterangan_pengeluaran
      t.references :status, foreign_key: true
      t.references :warehouse, foreign_key: true
      t.references :user, foreign_key: true
      t.string :kode_proyek
      t.json :dokumen_pengeluaran

      t.timestamps
    end
  end
end
