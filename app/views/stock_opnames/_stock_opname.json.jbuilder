json.extract! stock_opname, :id, :kode_qr_code, :item_id, :tanggal, :jumlah_tersedia, :measurement_id, :lokasi_penempatan, :jumlah_fisik, :selisih, :keterangan, :warehouse_id, :created_at, :updated_at
json.url stock_opname_url(stock_opname, format: :json)
