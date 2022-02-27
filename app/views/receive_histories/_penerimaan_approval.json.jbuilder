json.extract! receive_history, :id, :receive_id, :status_id, :user_id, :role_id, :catatan_penerimaan, :created_at, :updated_at
json.url penerimaan_approval_url(receive_history, format: :json)
