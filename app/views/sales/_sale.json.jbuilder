json.extract! sale, :id, :nomor_pengeluaran, :tanggal_pengeluaran, :jenis_pengeluaran,
              :keterangan_pengeluaran, :kode_program_fast, :nama_program_fast, :nama_inputer, :status_id, :user_id,
              :created_at, :updated_at
json.url sale_url(sale, format: :json)
