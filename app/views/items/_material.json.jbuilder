json.extract! item, :id, :nama_barang, :spesifikasi_barang, :kode_barang, :tahun_perolehan, :item_group_id,
              :created_at, :updated_at
json.url item_url(item, format: :json)
