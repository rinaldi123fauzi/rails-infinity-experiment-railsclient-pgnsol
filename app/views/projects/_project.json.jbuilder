json.extract! project, :id, :nomor_pengeluaran, :tanggal_pengeluaran, :jenis_pengeluaran,
              :keterangan_pengeluaran, :status_id, :user_id, :kode_proyek, :dokumen_pengeluaran, :kode_akun,
              :nama_akun, :created_at, :updated_at
json.url project_url(project, format: :json)
