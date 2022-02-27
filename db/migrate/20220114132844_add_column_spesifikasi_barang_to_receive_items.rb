class AddColumnSpesifikasiBarangToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    add_column :receive_items, :spesifikasi_barang, :string
  end
end
