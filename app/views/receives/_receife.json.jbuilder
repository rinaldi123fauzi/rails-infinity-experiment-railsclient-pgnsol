# frozen_string_literal: true

json.extract! receife, :id, :jenis, :judul_bast, :nomor_bast, :tanggal_bast, :jumlah_harga, :nama_penyedia,
              :nomor_po, :tanggal_po, :project_program, :kode_proyek, :nama_proyek, :kode_akun, :pemilik_material,
              :kode_transaksi_penerimaan, :tanggal_transaksi, :dokumen, :user_id, :warehouses_id, :status_id,
              :division_id, :created_at, :updated_at
json.url receife_url(receife, format: :json)
