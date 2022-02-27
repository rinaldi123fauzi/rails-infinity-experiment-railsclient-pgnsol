class CreateReceives < ActiveRecord::Migration[5.2]
  def change
    create_table :receives do |t|
      t.string :jenis
      t.string :judul_bast
      t.string :nomor_bast
      t.date :tanggal_bast
      t.string :nama_penyedia
      t.string :nomor_po
      t.date :tanggal_po
      t.string :project_program
      t.string :kode_proyek
      t.string :nama_proyek
      t.string :kode_akun
      t.string :pemilik_material

      t.timestamps
    end
  end
end
