class ChangeDataTypeJumlahHargaToReceiveItems < ActiveRecord::Migration[5.2]
  def change
    change_column :receive_items, :jumlah_harga, :bigint
  end
end
