# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_27_051640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "nama_divisi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_groups", force: :cascade do |t|
    t.string "kelompok_barang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "nama_barang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spesifikasi_barang"
    t.string "kode_qr"
    t.bigint "item_group_id"
    t.date "periode_perolehan"
    t.string "ukuran"
    t.string "merek"
    t.string "serial"
    t.string "lain"
    t.string "tipe"
    t.index ["item_group_id"], name: "index_items_on_item_group_id"
  end

  create_table "maintenance_assets", force: :cascade do |t|
    t.string "nomor_pengeluaran"
    t.date "tanggal_pengeluaran"
    t.string "jenis_pengeluaran"
    t.string "keterangan_pengeluaran"
    t.bigint "status_id"
    t.bigint "warehouse_id"
    t.bigint "user_id"
    t.string "kode_proyek"
    t.json "dokumen_pengeluaran"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nama_proyek"
    t.string "nama_inputer"
    t.string "kode_akun"
    t.string "nama_akun"
    t.index ["status_id"], name: "index_maintenance_assets_on_status_id"
    t.index ["user_id"], name: "index_maintenance_assets_on_user_id"
    t.index ["warehouse_id"], name: "index_maintenance_assets_on_warehouse_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.string "nama_satuan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "actor_id"
    t.string "notify_type", null: false
    t.string "target_type"
    t.bigint "target_id"
    t.string "second_target_type"
    t.bigint "second_target_id"
    t.string "third_target_type"
    t.bigint "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "project_items", force: :cascade do |t|
    t.string "kode_proyek"
    t.string "nama_proyek"
    t.bigint "item_id"
    t.bigint "measurement_id"
    t.integer "jumlah_tersedia"
    t.integer "jumlah_keluar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "warehouse_id"
    t.string "kode_qr"
    t.string "jumlah_permintaan"
    t.index ["item_id"], name: "index_project_items_on_item_id"
    t.index ["measurement_id"], name: "index_project_items_on_measurement_id"
    t.index ["project_id"], name: "index_project_items_on_project_id"
    t.index ["warehouse_id"], name: "index_project_items_on_warehouse_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "nomor_pengeluaran"
    t.date "tanggal_pengeluaran"
    t.string "jenis_pengeluaran"
    t.string "keterangan_pengeluaran"
    t.bigint "status_id"
    t.bigint "user_id"
    t.string "kode_proyek"
    t.json "dokumen_pengeluaran"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nama_proyek"
    t.string "kode_akun"
    t.string "nama_inputer"
    t.string "nama_akun"
    t.index ["status_id"], name: "index_projects_on_status_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "receive_histories", force: :cascade do |t|
    t.bigint "receive_id"
    t.bigint "status_id"
    t.bigint "user_id"
    t.bigint "role_id"
    t.string "catatan_penerimaan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status_approval"
    t.index ["receive_id"], name: "index_receive_histories_on_receive_id"
    t.index ["role_id"], name: "index_receive_histories_on_role_id"
    t.index ["status_id"], name: "index_receive_histories_on_status_id"
    t.index ["user_id"], name: "index_receive_histories_on_user_id"
  end

  create_table "receive_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "harga_satuan"
    t.integer "jumlah_pesanan"
    t.integer "jumlah_terima"
    t.bigint "jumlah_harga"
    t.bigint "item_id"
    t.bigint "measurement_id"
    t.bigint "receive_id"
    t.string "qr_code"
    t.string "lokasi_penempatan"
    t.integer "jumlah_permintaan"
    t.integer "jumlah_keluar"
    t.string "status_item"
    t.bigint "warehouse_id"
    t.index ["item_id"], name: "index_receive_items_on_item_id"
    t.index ["measurement_id"], name: "index_receive_items_on_measurement_id"
    t.index ["receive_id"], name: "index_receive_items_on_receive_id"
    t.index ["warehouse_id"], name: "index_receive_items_on_warehouse_id"
  end

  create_table "receives", force: :cascade do |t|
    t.string "jenis"
    t.string "judul_bast"
    t.string "nomor_bast"
    t.date "tanggal_bast"
    t.string "nama_penyedia"
    t.string "nomor_po"
    t.date "tanggal_po"
    t.string "project_program"
    t.string "kode_proyek"
    t.string "nama_proyek"
    t.string "kode_akun"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kode_transaksi_penerimaan"
    t.bigint "warehouse_id"
    t.json "dokumen"
    t.bigint "user_id"
    t.bigint "status_id"
    t.string "jumlah_harga_bast"
    t.string "lokasi_penempatan"
    t.bigint "division_id"
    t.string "nama_akun"
    t.string "kode_dan_nama_proyek"
    t.string "kode_program"
    t.string "nama_program"
    t.string "total_harga_penerimaan"
    t.text "keterangan_penerimaan"
    t.string "inputer"
    t.string "catatan"
    t.integer "id_role"
    t.string "kategori_kode"
    t.index ["division_id"], name: "index_receives_on_division_id"
    t.index ["status_id"], name: "index_receives_on_status_id"
    t.index ["user_id"], name: "index_receives_on_user_id"
    t.index ["warehouse_id"], name: "index_receives_on_warehouse_id"
  end

  create_table "returs", force: :cascade do |t|
    t.string "jenis_penerimaan"
    t.string "nomor_pengeluaran"
    t.string "kode_proyek"
    t.string "nama_proyek"
    t.string "jenis_pengeluaran"
    t.string "asal_gudang"
    t.string "gudang_pembelian"
    t.string "nama_inputer"
    t.json "dokumen_retur"
    t.string "keterangan_retur"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "warehouse_id"
    t.bigint "receive_id"
    t.bigint "sale_id"
    t.index ["receive_id"], name: "index_returs_on_receive_id"
    t.index ["sale_id"], name: "index_returs_on_sale_id"
    t.index ["warehouse_id"], name: "index_returs_on_warehouse_id"
  end

  create_table "role_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_assignments_on_role_id"
    t.index ["user_id"], name: "index_role_assignments_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.text "permissions"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_histories", force: :cascade do |t|
    t.string "catatan_penjualan"
    t.bigint "user_id"
    t.bigint "status_id"
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["role_id"], name: "index_sale_histories_on_role_id"
    t.index ["sale_id"], name: "index_sale_histories_on_sale_id"
    t.index ["status_id"], name: "index_sale_histories_on_status_id"
    t.index ["user_id"], name: "index_sale_histories_on_user_id"
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer "jumlah_keluar"
    t.integer "jumlah_tersedia"
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "measurement_id"
    t.string "lokasi_penempatan"
    t.string "jumlah_permintaan"
    t.bigint "receive_item_id"
    t.bigint "warehouse_id"
    t.index ["measurement_id"], name: "index_sale_items_on_measurement_id"
    t.index ["receive_item_id"], name: "index_sale_items_on_receive_item_id"
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
    t.index ["warehouse_id"], name: "index_sale_items_on_warehouse_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "nomor_penjualan"
    t.date "tanggal_penjualan"
    t.string "jenis_pengeluaran"
    t.string "keterangan_penjualan"
    t.bigint "status_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "dokumen_penjualan"
    t.string "nama_inputer"
    t.string "catatan_penjualan"
    t.string "status_approval"
    t.string "kode_proyek"
    t.string "nama_proyek"
    t.string "kode_akun"
    t.string "nama_akun"
    t.bigint "receive_id"
    t.string "kategori_kode"
    t.integer "id_role"
    t.index ["receive_id"], name: "index_sales_on_receive_id"
    t.index ["status_id"], name: "index_sales_on_status_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "nama_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kategori"
  end

  create_table "stock_opnames", force: :cascade do |t|
    t.string "kode_qr_code"
    t.bigint "item_id"
    t.date "tanggal"
    t.string "jumlah_tersedia"
    t.bigint "measurement_id"
    t.string "lokasi_penempatan"
    t.string "jumlah_fisik"
    t.string "selisih"
    t.string "keterangan"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_stock_opnames_on_item_id"
    t.index ["measurement_id"], name: "index_stock_opnames_on_measurement_id"
    t.index ["warehouse_id"], name: "index_stock_opnames_on_warehouse_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.string "user_type"
    t.boolean "state", default: false
    t.boolean "confirm", default: false
    t.bigint "division_id"
    t.index ["division_id"], name: "index_users_on_division_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "nama_gudang"
    t.text "alamat_gudang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inisial"
  end

  add_foreign_key "items", "item_groups"
  add_foreign_key "maintenance_assets", "statuses"
  add_foreign_key "maintenance_assets", "users"
  add_foreign_key "maintenance_assets", "warehouses"
  add_foreign_key "project_items", "items"
  add_foreign_key "project_items", "measurements"
  add_foreign_key "project_items", "projects"
  add_foreign_key "project_items", "warehouses"
  add_foreign_key "projects", "statuses"
  add_foreign_key "projects", "users"
  add_foreign_key "receive_histories", "receives", column: "receive_id"
  add_foreign_key "receive_histories", "roles"
  add_foreign_key "receive_histories", "statuses"
  add_foreign_key "receive_histories", "users"
  add_foreign_key "receive_items", "items"
  add_foreign_key "receive_items", "measurements"
  add_foreign_key "receive_items", "receives", column: "receive_id"
  add_foreign_key "receive_items", "warehouses"
  add_foreign_key "receives", "divisions"
  add_foreign_key "receives", "statuses"
  add_foreign_key "receives", "users"
  add_foreign_key "receives", "warehouses"
  add_foreign_key "returs", "receives", column: "receive_id"
  add_foreign_key "returs", "sales"
  add_foreign_key "returs", "warehouses"
  add_foreign_key "role_assignments", "roles"
  add_foreign_key "role_assignments", "users"
  add_foreign_key "sale_histories", "roles"
  add_foreign_key "sale_histories", "sales"
  add_foreign_key "sale_histories", "statuses"
  add_foreign_key "sale_histories", "users"
  add_foreign_key "sale_items", "measurements"
  add_foreign_key "sale_items", "receive_items"
  add_foreign_key "sale_items", "sales"
  add_foreign_key "sale_items", "warehouses"
  add_foreign_key "sales", "receives", column: "receive_id"
  add_foreign_key "sales", "statuses"
  add_foreign_key "sales", "users"
  add_foreign_key "stock_opnames", "items"
  add_foreign_key "stock_opnames", "measurements"
  add_foreign_key "stock_opnames", "warehouses"
  add_foreign_key "users", "divisions"
end
