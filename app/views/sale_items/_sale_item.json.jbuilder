json.extract! sale_item, :id, :jumlah_keluar, :item_id, :jumlah_tersedia, :sale_id, :created_at, :updated_at
json.url sale_item_url(sale_item, format: :json)
