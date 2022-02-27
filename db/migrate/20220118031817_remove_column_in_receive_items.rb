class RemoveColumnInReceiveItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :receive_items, :merek, :string
    remove_column :receive_items, :serial, :string
    remove_column :receive_items, :ukuran, :string
    remove_column :receive_items, :lain, :string
    remove_column :receive_items, :spesifikasi_barang, :string
    remove_column :receive_items, :tipe, :string
  end
end
