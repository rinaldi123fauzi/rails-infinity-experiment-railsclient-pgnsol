json.extract! sale_history, :id, :catatan_penjualan, :user_id, :status_id, :sale_id, :created_at, :updated_at
json.url sale_approval_url(sale_history, format: :json)
