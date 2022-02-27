json.extract! project_item, :id, :jenis_kode_biaya, :kode_proyek, :nama_proyek, :item_id, :measurement_id, :jumlah_tersedia, :jumlah_keluar, :created_at, :updated_at
json.url project_item_url(project_item, format: :json)
